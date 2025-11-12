#!/bin/bash
# carga las variables de entono pasadas desde el DockerCompose
set -e

source /root/admin/base/usuarios/usuarios.sh

main() {
    newUser
    # encargada de dejar este contendor vivo en BGround
    tail -f /dev/null
    ## script's que se encargar de configurar el imagen/contenedor
}

main