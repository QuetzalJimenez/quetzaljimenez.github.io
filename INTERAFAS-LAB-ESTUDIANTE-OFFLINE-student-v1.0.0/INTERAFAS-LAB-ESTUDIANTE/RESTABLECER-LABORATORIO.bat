@echo off
setlocal
cd /d "%~dp0"
title INTERAFAS-LAB - Restablecer

if not exist ".env" copy /Y ".env.example" ".env" >nul

echo.
echo ==========================================
echo ADVERTENCIA
echo ==========================================
echo Esta accion eliminara el progreso local,
echo las banderas, la bitacora y la base de datos
echo del intento actual.
echo.
set /p CONFIRM="Escribe RESTABLECER para continuar: "

if /I not "%CONFIRM%"=="RESTABLECER" (
  echo Operacion cancelada.
  pause
  exit /b 0
)

docker compose -f docker-compose.student.yml --env-file .env down -v --remove-orphans
if errorlevel 1 (
  echo ERROR: No fue posible limpiar el entorno.
  pause
  exit /b 1
)

docker compose -f docker-compose.student.yml --env-file .env up -d
if errorlevel 1 (
  echo ERROR: No fue posible volver a iniciar el entorno.
  pause
  exit /b 1
)

echo.
echo INTERAFAS-LAB fue restablecido al estado inicial.
echo.
start "" "http://localhost:8092"
pause
