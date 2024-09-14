# Define el directorio que quieres verificar y configurar
SAFE_DIRECTORY="/workspaces/codespaces-uni"

# Verificar si el directorio ya está en la configuración de safe.directory
if git config --global --get-all safe.directory | grep -q "$SAFE_DIRECTORY"; then
    echo "$SAFE_DIRECTORY ya está configurado como un directorio seguro."
else
    echo "$SAFE_DIRECTORY no está configurado como un directorio seguro. Configurando..."
    git config --global --add safe.directory "$SAFE_DIRECTORY"
    
    if [ $? -eq 0 ]; then
        echo "$SAFE_DIRECTORY ha sido configurado como un directorio seguro."
        exit 0
    else
        echo "Error al configurar $SAFE_DIRECTORY como un directorio seguro."
        exit 1
    fi
fi