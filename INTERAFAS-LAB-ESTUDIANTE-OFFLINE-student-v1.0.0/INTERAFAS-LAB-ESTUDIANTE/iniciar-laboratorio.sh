#!/usr/bin/env sh
set -eu
cd "$(dirname "$0")"

[ -f .env ] || cp .env.example .env

command -v docker >/dev/null 2>&1 || { echo "ERROR: Docker no esta instalado."; exit 1; }
docker info >/dev/null 2>&1 || { echo "ERROR: Docker no esta ejecutandose."; exit 1; }
docker compose version >/dev/null 2>&1 || { echo "ERROR: Docker Compose no esta disponible."; exit 1; }

echo "Buscando actualizaciones de imagenes..."
docker compose -f docker-compose.student.yml --env-file .env pull >/dev/null 2>&1 || echo "Aviso: se usaran las imagenes locales disponibles."

docker compose -f docker-compose.student.yml --env-file .env up -d

echo "Esperando servicios..."
i=0
while [ "$i" -lt 40 ]; do
  if curl -fsS http://localhost:8080 >/dev/null 2>&1     && curl -fsS http://localhost:8091 >/dev/null 2>&1     && curl -fsS http://localhost:8092 >/dev/null 2>&1; then
      echo "INTERAFAS-LAB iniciado."
      echo "Portal INTERAFAS:    http://localhost:8080"
      echo "Pulso Metropolitano: http://localhost:8091"
      echo "Portal del Auditor:  http://localhost:8092"
      exit 0
  fi
  i=$((i+1))
  sleep 2
done

echo "ERROR: algun servicio no respondio."
docker compose -f docker-compose.student.yml --env-file .env ps
exit 1
