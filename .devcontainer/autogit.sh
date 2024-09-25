# Define el comando git con el directorio actual
GIT="git --git-dir=$PWD/.git --work-tree=$PWD"

# Verificar si hay cambios antes de hacer git add y commit
if ! $GIT diff --quiet; then
    # Añadir todos los cambios al área de stage, excluyendo archivos temporales o logs
    $GIT add .

    # Verificar si hay algo en el área de stage después de excluir archivos no deseados
    if $GIT diff --cached --quiet; then
        echo "No hay cambios relevantes para commitear"
        exit 0
    fi

    # Obtener el archivo modificado más reciente
    LAST_MODIFIED_FILE=$($GIT diff --name-only | head -n 1)

    # Obtener el nombre de usuario configurado en git o el nombre de usuario del sistema
    USER=$($GIT config user.name)
    [ -z "$USER" ] && USER=$(whoami)

    # Generar un mensaje de commit más descriptivo
    COMMIT_MSG="[$USER] Actualización: $LAST_MODIFIED_FILE - $(date +"%Y-%m-%d %H:%M:%S")"

    # Realizar el commit y gestionar errores
    if ! $GIT commit -m "$COMMIT_MSG"; then
        echo "Error: No se pudo realizar el commit"
        exit 1
    else
        echo "Commit realizado con éxito: $COMMIT_MSG"
    fi

    # Hacer push de los cambios a la rama actual y gestionar errores
    if ! $GIT push; then
        echo "Error: No se pudo hacer push de los cambios"
        exit 1
    fi
fi