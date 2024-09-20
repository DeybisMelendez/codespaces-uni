# Codespace para Estudiantes de la UNI

Este repositorio ha sido creado por **Deybis Antonio Melendez Vargas**, estudiante de la Universidad Nacional de Ingeniería (UNI), con el objetivo de proporcionar un entorno de desarrollo listo para que los estudiantes puedan realizar sus tareas de programación de manera rápida y eficiente utilizando GitHub Codespaces.

La idea principal detrás de esta plantilla es facilitar el trabajo en las tareas de programación que forman parte del plan de estudios, eliminando la necesidad de configuraciones complicadas. Este entorno viene pre-configurado con todo lo necesario para que los estudiantes puedan enfocarse en el código y no en los detalles técnicos de la configuración.

Está diseñado para cualquier estudiante que necesite trabajar con lenguajes como Python y C/C++, o que simplemente busque un entorno rápido y accesible para sus proyectos y prácticas.

Si eres un estudiante de la UNI o de cualquier otra universidad y necesitas un entorno de desarrollo ágil y sin complicaciones, esta plantilla es para ti.

Esta plantilla incluye lo siguiente:

- **Configuración de Codespace**: Listo para ser usado con Codespaces.
- **Editor pre-configurado**: Visual Studio Code con extensiones recomendadas para lenguajes de programación utilizados Python y C/C++.
- **Dependencias iniciales**: Instalación de dependencias comunes como Python, GCC, make, valgrind, entre otros.

## ¿Cómo empezar?

Realice un **Fork** a este repositorio. En la parte superior derecha del repositorio encontrará un botón llamado fork, de click ahí y luego en **"create fork"**, opcionalmente puede darle un nombre nuevo a su codespace.

Dar click en el botón **"Open in Github Codespaces"** o bien seguir los siguientes pasos:

1. Haz clic en el botón "Code" en la esquina superior derecha del repositorio donde hizo fork.
2. Seleccione Codespaces
3. Selecciona "Create Codespace on main".
4. Espera unos momentos mientras se configura tu entorno de desarrollo.

[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/DeybisMelendez/codespaces-uni?quickstart=1)

Github le asignará una url aleatorio para acceder al codespaces. Puede guardar el url para volver luego o acceder desde su fork clicando otra vez en el botón "Open in Github Codespaces".

## Entorno de Desarrollo

El entorno está pre-configurado con:

- **Alpine Linux**: Distribución linux ligera, segura y eficiente.
- **Python**: Python 3 y Pip para instalación de paquetes.
- **C/C++**: Todas las librerías necesarias para compilar, analizar y depurar código en C y C++.

## Actualizaciones automáticas

- El codespaces está pre-configurado para actualizar su repositorio automáticamente cada vez que guarda un archivo.
- El codespaces está pre-configurado para recibir actualizaciones automáticamente desde el repositorio original.

**Nota**: Es posible que requiera hacer rebuild cuando reciba una actualización. Si tiene alguna dificultad para actualizar el repositorio puede intentar escribiendo en la terminal `sh .devcontainer/update.sh`

## Futuras implementaciones (TODO)

- Configuración para programación en Java
- Configuración para desarrollo web (HTML, CSS, JS)

## Solicitar feature, arreglar bug o consulta

Entre en el apartado Issues en el repositorio original https://github.com/DeybisMelendez/codespaces-uni/issues y agregue un nuevo issue con su comentario.