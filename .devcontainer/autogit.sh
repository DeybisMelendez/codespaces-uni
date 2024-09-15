#!/bin/sh

# Define el comando git con el directorio actual
GIT="git --git-dir=$PWD/.git --work-tree=$PWD"

# Hacer pull de la rama actual
$GIT pull

# Añadir todos los cambios al área de stage
$GIT add .

# Obtener la fecha actual para el commit
COMMIT=$(date +"%Y-%m-%d %H:%M:%S")

# Hacer el commit con la fecha actual como mensaje
$GIT commit -m "$COMMIT"

# Hacer push de los cambios
$GIT push
