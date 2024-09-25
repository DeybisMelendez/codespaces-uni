# Actualizar repositorio
apk update
# Instalar paquetes para desarrollo en C/C++
apk add build-base gdb clang cmake autoconf automake libtool valgrind
# Instalar paquetes para desarrollo en Python 3
apk add python3 py3-pip
# Instalar paquetes para desarrollo en Java
apk add openjdk21-jdk
# Instalar git
apk add git
# Otros paquetes
apk add fontconfig
# Instalar la fuente Fira Code manualmente desde GitHub
echo "Instalando Fira Code manualmente..."
mkdir -p /usr/share/fonts/fira-code
cd /usr/share/fonts/fira-code
wget https://github.com/tonsky/FiraCode/releases/download/6.2/Fira_Code_v6.2.zip
unzip Fira_Code_v6.2.zip

# Actualizar caché de fuentes
fc-cache -fv