#!/bin/bash
set -e

# 1. Cargamos las herramientas
source /root/admin/base/usuarios/MainUsuarios.sh
source /root/admin/base/ssh/MainSSH.sh
source /root/admin/base/sudo/MainSudo.sh

main() {
    touch /root/logs/informe.log
    
    # 2. Ejecutamos la configuración base (OBLIGATORIO para tener usuario y SSH)
    newUser
    if [ "$?" -eq 0 ]; then
        make_sudo
        make_ssh
    fi

    # 3. Arrancamos Nginx
    # Lo hacemos aquí porque ya tenemos usuario, pero aún no hemos congelado el contenedor
    echo "Iniciando Nginx..." >> /root/logs/informe.log
    service nginx start

    # 4. Mantenemos el contenedor encendido
    tail -f /dev/null
}

main