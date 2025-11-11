#!/bin/bash
# carga las variables de entono pasadas desde el D.Compose
set -e

newUser(){
    useradd -rm -d /home/${USUARIO} -s /bin/bash ${USUARIO}
    echo "${USUARIO}:${PASSWORD}" | chpasswd
    echo "Bienvenido ${USUARIO} a tu empresa ..." > /home/${USUARIO}/bienvenida.txt
}

main() {
    newUser
    # encargada de dejar este contendor vivo en BGround
    tail -f /dev/null
    ## script's que se encargar de configurar el imagen/contenedor
}

main