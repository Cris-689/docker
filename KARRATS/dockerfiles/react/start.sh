#!/bin/bash
set -e

# 1. Cargamos las funciones heredadas de ubbase/ubnginx
source /root/admin/base/usuarios/MainUsuarios.sh
source /root/admin/base/ssh/MainSSH.sh
source /root/admin/base/sudo/MainSudo.sh

main() {
    touch /root/logs/informe.log
    
    # 2. Configuración del Sistema (Usuario, SSH)
    newUser
    if [ "$?" -eq 0 ]; then
        make_sudo
        make_ssh
    fi
    
    # 3. Permisos (Opcional, pero recomendado para la carpeta web)
    chown -R www-data:www-data /var/www/MiWeb
    chmod -R 755 /var/www/MiWeb

    # 4. Arrancar Nginx
    echo "Iniciando Nginx con la app React pre-compilada..." >> /root/logs/informe.log
    service nginx start

    # 5. Mantener vivo
    tail -f /dev/null
}

main