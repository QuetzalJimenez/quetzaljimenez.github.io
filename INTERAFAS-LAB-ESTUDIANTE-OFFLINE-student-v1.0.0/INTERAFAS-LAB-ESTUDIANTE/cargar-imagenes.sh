#!/usr/bin/env sh
set -eu
cd "$(dirname "$0")"

[ -f interafas-images.tar ] || { echo "ERROR: No se encontro interafas-images.tar."; exit 1; }
docker info >/dev/null 2>&1 || { echo "ERROR: Docker no esta ejecutandose."; exit 1; }

echo "Cargando imagenes de INTERAFAS-LAB..."
docker load -i interafas-images.tar
echo "Imagenes cargadas. Ejecuta ./iniciar-laboratorio.sh"
