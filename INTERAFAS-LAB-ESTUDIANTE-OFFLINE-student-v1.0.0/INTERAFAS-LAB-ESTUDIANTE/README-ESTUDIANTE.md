# INTERAFAS-LAB — Edición Estudiante v1.0

Este paquete ejecuta una copia local e independiente del laboratorio.

## Requisitos

- Windows 10/11, macOS o Linux.
- Docker Desktop o Docker Engine con Docker Compose.
- Al menos 4 GB de RAM disponibles para Docker.
- Puertos locales 8080, 8091 y 8092 disponibles.

## Qué paquete recibiste

### LITE
Requiere Internet la primera vez para descargar las imágenes Docker.

### OFFLINE
Incluye `interafas-images.tar`. Antes de verificar o iniciar el laboratorio debes cargar las imágenes:

Windows:

```text
CARGAR-IMAGENES.bat
```

macOS / Linux:

```bash
chmod +x *.sh
./cargar-imagenes.sh
```

Después el procedimiento es igual en ambas ediciones.

## Windows

1. Ejecuta `VERIFICAR-INSTALACION.bat` antes del día de la práctica.
2. El día del ejercicio ejecuta `INICIAR-LABORATORIO.bat`.
3. Abre primero el Portal del Auditor: http://localhost:8092
4. Registra tus datos y matrícula.
5. Conserva abierta esa sesión durante el ejercicio.
6. Para pausar sin perder avance usa `DETENER-LABORATORIO.bat`.
7. Usa `RESTABLECER-LABORATORIO.bat` sólo cuando el docente lo indique.

## macOS / Linux

Primera vez:

```bash
chmod +x *.sh
./verificar-instalacion.sh
```

Para iniciar:

```bash
./iniciar-laboratorio.sh
```

Para detener sin borrar progreso:

```bash
./detener-laboratorio.sh
```

Para reiniciar completamente:

```bash
./restablecer-laboratorio.sh
```

## Direcciones

- Portal INTERAFAS: http://localhost:8080
- Pulso Metropolitano: http://localhost:8091
- Portal del Auditor: http://localhost:8092

## Importante

- No ejecutes `docker compose down -v` si deseas conservar tu progreso.
- El laboratorio está diseñado para ejecutarse únicamente de forma local y controlada.
- Si un puerto está ocupado, informa al instructor antes de modificar `.env`.
- No compartas banderas ni archivos de evidencia con otros equipos.
