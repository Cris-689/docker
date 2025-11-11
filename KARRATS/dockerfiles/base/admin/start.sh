#!/bin/bash
# carga las variables de entono pasadas desde el D.Compose
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

newUser(){
    checkUsuario
    if [ "$?" -eq 0 ]; then
        useradd -rm -d /home/${USUARIO} -s /bin/bash ${USUARIO}
        echo "${USUARIO}:${PASSWORD}" | chpasswd
        echo "Bienvenido ${USUARIO} a tu empresa ..." > /home/${USUARIO}/bienvenida.txt
    fi
}

main() {
    newUser
    # encargada de dejar este contendor vivo en BGround
    tail -f /dev/null
    ## script's que se encargar de configurar el imagen/contenedor
}

main