#!/bin/sh

# Define el directorio que quieres verificar y configurar como seguro
SAFE_DIRECTORY="/workspaces/codespaces-uni"
REPO="https://github.com/DeybisMelendez/codespaces-uni.git"

git config --global --add safe.directory "$SAFE_DIRECTORY"
git remote add upstream $REPO