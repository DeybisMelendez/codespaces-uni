#!/bin/sh

# Obtener y fusionar cambios del repositorio upstream
git fetch origin
git rebase origin
git fetch upstream
git rebase upstream/main
