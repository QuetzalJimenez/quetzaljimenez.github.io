@echo off
setlocal
cd /d "%~dp0"
title INTERAFAS-LAB - Iniciar

if not exist ".env" copy /Y ".env.example" ".env" >nul

echo.
echo ==========================================
echo        INTERAFAS-LAB
echo        Inicializando laboratorio
echo ==========================================
echo.

docker info >nul 2>&1
if errorlevel 1 (
  echo ERROR: Docker Desktop no esta disponible.
  echo Inicia Docker Desktop y vuelve a ejecutar este archivo.
  pause
  exit /b 1
)

docker compose version >nul 2>&1
if errorlevel 1 (
  echo ERROR: Docker Compose no esta disponible.
  pause
  exit /b 1
)

echo Buscando actualizaciones de las imagenes...
docker compose -f docker-compose.student.yml --env-file .env pull >nul 2>&1
if errorlevel 1 (
  echo No fue posible actualizar las imagenes. Se intentara usar la copia local.
)

echo Iniciando servicios...
docker compose -f docker-compose.student.yml --env-file .env up -d
if errorlevel 1 (
  echo.
  echo ERROR: No fue posible iniciar INTERAFAS-LAB.
  echo Ejecuta VERIFICAR-INSTALACION.bat para diagnosticar el equipo.
  pause
  exit /b 1
)

echo.
echo Esperando disponibilidad de los portales...
powershell -NoProfile -ExecutionPolicy Bypass -Command ^
  "$urls=@('http://localhost:8080','http://localhost:8091','http://localhost:8092');" ^
  "$deadline=(Get-Date).AddSeconds(75);" ^
  "do { $ok=$true; foreach($u in $urls){ try { $r=Invoke-WebRequest -UseBasicParsing -Uri $u -TimeoutSec 3; if($r.StatusCode -lt 200){$ok=$false} } catch {$ok=$false} }; if(-not $ok){Start-Sleep -Seconds 2} } while(-not $ok -and (Get-Date) -lt $deadline);" ^
  "if(-not $ok){exit 1}"
if errorlevel 1 (
  echo.
  echo AVISO: Los contenedores iniciaron, pero algun portal aun no responde.
  docker compose -f docker-compose.student.yml --env-file .env ps
  pause
  exit /b 1
)

echo.
echo ==========================================
echo LABORATORIO INICIADO
echo ==========================================
echo.
echo Portal INTERAFAS:      http://localhost:8080
echo Pulso Metropolitano:   http://localhost:8091
echo Portal del Auditor:    http://localhost:8092
echo.
echo Inicia primero en el Portal del Auditor.
echo.

start "" "http://localhost:8092"
pause
