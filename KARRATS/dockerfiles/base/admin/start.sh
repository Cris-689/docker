#!/bin/bash
# carga las variables de entono pasadas desde el DockerCompose
set -e

source /root/admin/base/usuarios/usuarios.sh
source /root/admin/base/ssh/Mainssh.sh

main() {
    newUser
    if [ "$?" -eq 0 ]; then
        Mainssh
    fi
    #encargada de dejar este contendor vivo en BGround
    tail -f /dev/null
}

main