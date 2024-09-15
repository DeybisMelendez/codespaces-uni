#!/bin/sh

# Obtener y fusionar cambios del repositorio upstream
GIT="git --git-dir=$PWD/.git --work-tree=$PWD"
$GIT fetch origin
$GIT rebase origin
$GIT fetch upstream
$GIT rebase upstream/main
$GIT add .
$GIT commit -m "Actualización $(date +"%Y-%m-%d %H:%M:%S")"
$GIT push