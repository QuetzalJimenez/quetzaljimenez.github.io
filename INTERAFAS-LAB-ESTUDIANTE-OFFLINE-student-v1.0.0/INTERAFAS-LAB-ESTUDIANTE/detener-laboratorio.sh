#!/usr/bin/env sh
set -eu
cd "$(dirname "$0")"
[ -f .env ] || cp .env.example .env
docker compose -f docker-compose.student.yml --env-file .env stop
echo "INTERAFAS-LAB detenido. El progreso local se conserva."
