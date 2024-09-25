# Define el directorio que quieres verificar y configurar como seguro
REPO="https://github.com/DeybisMelendez/codespaces-uni.git"
GIT="git --git-dir=$PWD/.git --work-tree=$PWD"

# Intenta ejecutar un comando git
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
# Verificar si upstream ya existe, si no, agregarlo
if ! $GIT remote | grep -q upstream; then
    echo "Agregando remoto 'upstream': $REPO"
    $GIT remote add upstream $REPO
fi
# Obtener y fusionar cambios del repositorio upstream
$GIT fetch upstream
COMMIT=$(date +"%Y-%m-%d %H:%M:%S")
$GIT merge upstream/main -m "$COMMIT" --allow-unrelated-histories -X ours
$GIT push