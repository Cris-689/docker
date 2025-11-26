#!/bin/bash
# carga las variables de entono pasadas desde el DockerCompose
set -e

source /root/admin/base/usuarios/MainUsuarios.sh
source /root/admin/base/ssh/MainSSH.sh

main() {
    touch /root/logs/informe.log
    newUser
    if [ "$?" -eq 0 ]; then
        make_ssh
    fi
    #encargada de dejar este contendor vivo en BGround
    tail -f /dev/null
}

main