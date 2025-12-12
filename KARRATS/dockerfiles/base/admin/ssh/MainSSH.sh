#!/bin/bash
# carga las variables de entono pasadas desde el DockerCompose
set -e

make_ssh(){
    # cambiar puerto ssh
    sed -i "s/#Port 22/Port ${SSH_PORT}/" /etc/ssh/sshd_config

    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

    mkdir -p /home/${USUARIO}/.ssh
   # cp /root/admin/base/common/id_ed25519.pub /home/${USUARIO}/.ssh
    cat /root/admin/base/common/id_rsa.pub >> /home/${USUARIO}/.ssh/authorized_keys
    service ssh start
}