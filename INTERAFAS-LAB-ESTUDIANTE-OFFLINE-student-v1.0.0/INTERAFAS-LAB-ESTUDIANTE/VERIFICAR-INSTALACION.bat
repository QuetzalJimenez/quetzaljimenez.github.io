@echo off
setlocal
cd /d "%~dp0"
title INTERAFAS-LAB - Verificar instalacion

if not exist ".env" copy /Y ".env.example" ".env" >nul

echo.
echo ==========================================
echo INTERAFAS-LAB - VERIFICACION
echo ==========================================
echo.

docker --version
if errorlevel 1 goto :docker_error

docker compose version
if errorlevel 1 goto :compose_error

docker info >nul 2>&1
if errorlevel 1 goto :daemon_error

echo [OK] Docker esta disponible y en ejecucion.

powershell -NoProfile -ExecutionPolicy Bypass -Command ^
  "$ports=8080,8091,8092; $busy=@(); foreach($p in $ports){ if(Get-NetTCPConnection -State Listen -LocalPort $p -ErrorAction SilentlyContinue){$busy+=$p} }; if($busy.Count -gt 0){ Write-Host ('[AVISO] Puertos actualmente ocupados: '+($busy -join ', ')) } else { Write-Host '[OK] Puertos 8080, 8091 y 8092 disponibles.' }"

echo.
echo Descargando/verificando imagenes...
docker compose -f docker-compose.student.yml --env-file .env pull
if errorlevel 1 (
  echo [AVISO] No se pudieron descargar imagenes. Se comprobaran copias locales.
)

echo.
echo Iniciando prueba de servicios...
docker compose -f docker-compose.student.yml --env-file .env up -d
if errorlevel 1 goto :startup_error

powershell -NoProfile -ExecutionPolicy Bypass -Command ^
  "$urls=@('http://localhost:8080','http://localhost:8091','http://localhost:8092');" ^
  "$deadline=(Get-Date).AddSeconds(75);" ^
  "do { $ok=$true; foreach($u in $urls){ try { $r=Invoke-WebRequest -UseBasicParsing -Uri $u -TimeoutSec 3; if($r.StatusCode -lt 200){$ok=$false} } catch {$ok=$false} }; if(-not $ok){Start-Sleep -Seconds 2} } while(-not $ok -and (Get-Date) -lt $deadline);" ^
  "if($ok){Write-Host '[OK] Los tres portales responden correctamente.'; exit 0}else{exit 1}"
if errorlevel 1 goto :health_error

echo.
docker compose -f docker-compose.student.yml --env-file .env ps
echo.
echo ==========================================
echo EQUIPO LISTO PARA EL LABORATORIO
echo ==========================================
echo.
echo Puedes cerrar esta ventana.
echo El entorno queda iniciado para que puedas comprobarlo.
echo.
pause
exit /b 0

:docker_error
echo [ERROR] Docker no esta instalado o no esta en PATH.
goto :fail

:compose_error
echo [ERROR] Docker Compose no esta disponible.
goto :fail

:daemon_error
echo [ERROR] Docker Desktop esta instalado pero no esta ejecutandose.
goto :fail

:startup_error
echo [ERROR] Los contenedores no pudieron iniciarse.
goto :fail

:health_error
echo [ERROR] Uno o mas portales no respondieron.
docker compose -f docker-compose.student.yml --env-file .env ps
goto :fail

:fail
echo.
echo EQUIPO NO LISTO. Corrige el error indicado y vuelve a ejecutar esta prueba.
echo.
pause
exit /b 1
