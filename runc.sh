#!/bin/sh

# runc.sh es un script que ejecuta un código escrito en C de manera sencilla.
# Uso: sh runc.sh directorio/nombre_del_archivo_c_sin_extension

# Asegurarse de que el argumento $1 sea proporcionado
if [ -z "$1" ]; then
    echo "Uso: $0 <nombre_del_archivo_c_sin_extension>"
    exit 1
fi

# Asegurarse de que el archivo a compilar existe
if [ ! -f "$1.c" ]; then
    echo "Archivo $1.c no existe"
    exit 1
fi

# Compilar el archivo
make "$1"
if [ $? -ne 0 ]; then
    echo "Error en la compilación"
    exit 1
fi

# Capturar Ctrl+C (SIGINT) para que siempre se elimine el ejecutable al cancelar
trap 'rm -f "$1"; exit' INT

# Ejecutar el programa compilado
./"$1"

# Eliminar el ejecutable después de la ejecución
rm -f "$1"
