#!/bin/sh

# Define el directorio que quieres verificar y configurar como seguro
SAFE_DIRECTORY="/workspaces/codespaces-uni"
REPO="https://github.com/DeybisMelendez/codespaces-uni.git"

GIT="git --git-dir=$PWD/.git --work-tree=$PWD"
$GIT config --global --add safe.directory "$SAFE_DIRECTORY"
$GIT remote add upstream $REPO