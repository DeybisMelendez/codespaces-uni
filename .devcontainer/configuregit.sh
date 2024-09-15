#!/bin/sh

# Define el directorio que quieres verificar y configurar como seguro
SAFE_DIRECTORY="/workspaces/codespaces-uni"
REPO="https://github.com/DeybisMelendez/codespaces-uni.git"

# Verificar si el directorio ya está en la configuración de safe.directory
if git config --global --get-all safe.directory | grep -q "$SAFE_DIRECTORY"; then
    echo "$SAFE_DIRECTORY ya está configurado como un directorio seguro."
else
    echo "$SAFE_DIRECTORY no está configurado como un directorio seguro. Configurando..."
    git config --global --add safe.directory "$SAFE_DIRECTORY"
    
    if [ $? -eq 0 ]; then
        echo "$SAFE_DIRECTORY ha sido configurado como un directorio seguro."
    else
        echo "Error al configurar $SAFE_DIRECTORY como un directorio seguro."
        exit 1
    fi
fi
# Verificar si existe el remoto 'upstream'
if git remote | grep -q upstream; then
    echo "Remoto 'upstream' encontrado."
else
    echo "No se encontró el remoto 'upstream'. Agregando..."
    git remote add upstream $REPO
fi

git fetch upstream
git rebase upstream/main

if [ $? -eq 0 ]; then
    echo "Configuración de git pull con fast-forward completada."
else
    echo "Error al configurar git pull con fast-forward."
    exit 1
fi