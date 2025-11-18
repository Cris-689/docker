#!/bin/bash
# carga las variables de entono pasadas desde el DockerCompose
set -e

make_ssh(){
    # cambiar puerto ssh
    sed -i "s/#Port 22/Port ${SSH_PORT}/g" /etc/ssh/sshd_config
    # permitir login con password
    sed -i "s/PasswordAuthentication no/PasswordAuthentication yes/g" /etc/ssh/sshd_config
}
    