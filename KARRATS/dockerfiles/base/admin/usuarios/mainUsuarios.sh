#!/bin/bash
# carga las variables de entono pasadas desde el DockerCompose
set -e

checkUsuario(){
    if grep -q "${USUARIO}" /etc/passwd; then
        echo "El usuario ${USUARIO} existe en el sistema." >> /root/logs/informe.log
        return 1
    else
        echo "El usuario ${USUARIO} no existe en el sistema." >> /root/logs/informe.log
        return 0
    fi
}
checkHome(){
    if [ ! -d "/home/${USUARIO}" ]
    then
        echo "/home/${USUARIO} no existe" >> /root/logs/informe.log
        return 0 #true
    else
        echo "/home/${USUARIO} existe" >> /root/logs/informe.log
        return 1 #false
    fi
}
newUser(){
    checkUsuario
    if [ "$?" -eq 0 ]; then
        checkHome
        if [ "$?" -eq 0 ]; then
            useradd -rm -d /home/${USUARIO} -s /bin/bash ${USUARIO}
            echo "${USUARIO}:${PASSWORD}" | chpasswd
            echo "Bienvenido ${USUARIO} a tu empresa ..." > /home/${USUARIO}/bienvenida.txt
            echo "Usuario ${USUARIO} creado con éxito." >> /root/logs/informe.log
            echo "/home/${USUARIO} ya existe." >> /root/logs/informe.log
            return 0
        else
            echo "No se pudo crear el usuario ${USUARIO} porque el directorio home ya existe." >> /root/logs/informe.log
            return 1
        fi
    fi
}