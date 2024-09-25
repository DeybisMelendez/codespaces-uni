# Configuración inicial
REPO="https://github.com/DeybisMelendez/codespaces-uni.git"
GIT="git --git-dir=$PWD/.git --work-tree=$PWD"

# Función para detectar y agregar directorio inseguro
add_safe_directory_if_needed() {
    # Intenta ejecutar un comando git
    local GIT_OUTPUT
    GIT_OUTPUT=$($GIT status 2>&1)

    # Verificar si aparece un mensaje sobre el directorio inseguro
    if echo "$GIT_OUTPUT" | grep -q "is owned by"; then
        # Extraer el directorio inseguro del mensaje de error
        local UNSAFE_DIR
        UNSAFE_DIR=$(echo "$GIT_OUTPUT" | grep -oP '(?<=directory ).*(?= is owned)')
        
        # Agregar el directorio como seguro
        echo "Agregando directorio inseguro como seguro: $UNSAFE_DIR"
        $GIT config --global --add safe.directory "$UNSAFE_DIR"
    fi
}

# Verificar y configurar el directorio inseguro si es necesario
add_safe_directory_if_needed

# Verificar si upstream ya existe, si no, agregarlo
if ! $GIT remote | grep -q upstream; then
    echo "Agregando remoto 'upstream': $REPO"
    $GIT remote add upstream $REPO
fi

# Fetch de cambios desde upstream
echo "Obteniendo cambios de 'upstream'..."
if ! $GIT fetch upstream; then
    echo "Error: No se pudo obtener los cambios de 'upstream'. Verifica la conexión o el repositorio."
    exit 1
fi

# Verificar si hay nuevos cambios antes de hacer el rebase
UPSTREAM_STATUS=$($GIT rev-list HEAD...upstream/main --count)
if [ "$UPSTREAM_STATUS" -eq 0 ]; then
    echo "No hay cambios nuevos desde 'upstream'."
else
    # Hacer rebase de cambios
    echo "Rebasando cambios de 'upstream/main'..."
    if ! $GIT rebase upstream/main; then
        echo "Error: No se pudo rebase de los cambios desde 'upstream'."
        exit 1
    fi

    # Hacer push de los cambios rebaseados
    echo "Enviando cambios al repositorio remoto..."
    if ! $GIT push --force; then
        echo "Error: No se pudo hacer push de los cambios."
        exit 1
    fi

    echo "Push realizado con éxito."
fi