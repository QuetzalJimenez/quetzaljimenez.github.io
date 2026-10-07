#!/usr/bin/env sh
set -eu
cd "$(dirname "$0")"
[ -f .env ] || cp .env.example .env

command -v docker >/dev/null 2>&1 || { echo "[ERROR] Docker no esta instalado."; exit 1; }
docker compose version >/dev/null 2>&1 || { echo "[ERROR] Docker Compose no esta disponible."; exit 1; }
docker info >/dev/null 2>&1 || { echo "[ERROR] Docker no esta ejecutandose."; exit 1; }
command -v curl >/dev/null 2>&1 || { echo "[ERROR] curl no esta disponible."; exit 1; }

echo "[OK] Docker disponible."
docker compose -f docker-compose.student.yml --env-file .env pull || echo "[AVISO] No se pudieron actualizar las imagenes."
docker compose -f docker-compose.student.yml --env-file .env up -d

i=0
while [ "$i" -lt 40 ]; do
  if curl -fsS http://localhost:8080 >/dev/null 2>&1     && curl -fsS http://localhost:8091 >/dev/null 2>&1     && curl -fsS http://localhost:8092 >/dev/null 2>&1; then
      echo "[OK] Portal INTERAFAS"
      echo "[OK] Pulso Metropolitano"
      echo "[OK] Portal del Auditor"
      echo "EQUIPO LISTO PARA EL LABORATORIO"
      exit 0
  fi
  i=$((i+1))
  sleep 2
done

echo "[ERROR] Uno o mas servicios no respondieron."
docker compose -f docker-compose.student.yml --env-file .env ps
exit 1
