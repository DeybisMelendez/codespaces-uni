#!/bin/sh

# Obtener y fusionar cambios del repositorio upstream
GIT="git --git-dir=$PWD/.git --work-tree=$PWD"

$GIT fetch upstream
$GIT merge upstream/main -m "Actualización $(date +"%Y-%m-%d %H:%M:%S")"
$GIT push