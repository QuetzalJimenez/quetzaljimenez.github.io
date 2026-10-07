@echo off
setlocal
cd /d "%~dp0"
title INTERAFAS-LAB - Cargar imagenes offline

if not exist "interafas-images.tar" (
  echo ERROR: No se encontro interafas-images.tar en esta carpeta.
  pause
  exit /b 1
)

docker info >nul 2>&1
if errorlevel 1 (
  echo ERROR: Docker Desktop no esta disponible.
  pause
  exit /b 1
)

echo Cargando imagenes de INTERAFAS-LAB...
docker load -i interafas-images.tar
if errorlevel 1 (
  echo ERROR: No fue posible cargar las imagenes.
  pause
  exit /b 1
)

echo.
echo Imagenes cargadas correctamente.
echo Ahora ejecuta INICIAR-LABORATORIO.bat.
echo.
pause
