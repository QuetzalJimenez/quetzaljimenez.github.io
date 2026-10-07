#!/usr/bin/env sh
set -eu
cd "$(dirname "$0")"
[ -f .env ] || cp .env.example .env

printf "Esta accion eliminara todo el progreso local. Escribe RESTABLECER: "
read CONFIRM
[ "$CONFIRM" = "RESTABLECER" ] || { echo "Operacion cancelada."; exit 0; }

docker compose -f docker-compose.student.yml --env-file .env down -v --remove-orphans
docker compose -f docker-compose.student.yml --env-file .env up -d
echo "INTERAFAS-LAB restablecido al estado inicial."
