#!/bin/sh

# Obtener y fusionar cambios del repositorio upstream
echo "Actualizando el repositorio con cambios del upstream..."
git pull upstream main

if [ $? -eq 0 ]; then
    echo "Actualización desde upstream completada."
else
    echo "Error al actualizar el repositorio desde upstream."
    exit 1
fi
