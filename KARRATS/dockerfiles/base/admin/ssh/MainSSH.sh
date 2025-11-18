#!/bin/bash
# carga las variables de entono pasadas desde el DockerCompose
set -e

make_ssh(){
    sed -i 's/#Port 22/Port '"${SSH_PORT}"' /etc/ssh/sshd_config'
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
}