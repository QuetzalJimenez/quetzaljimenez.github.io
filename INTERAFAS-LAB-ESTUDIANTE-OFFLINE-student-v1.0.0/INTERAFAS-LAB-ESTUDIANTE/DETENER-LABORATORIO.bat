@echo off
setlocal
cd /d "%~dp0"
title INTERAFAS-LAB - Detener

if not exist ".env" copy /Y ".env.example" ".env" >nul

docker compose -f docker-compose.student.yml --env-file .env stop

echo.
echo INTERAFAS-LAB fue detenido.
echo Tu progreso local se conserva.
echo Para continuar despues, ejecuta INICIAR-LABORATORIO.bat.
echo.
pause
