#!/bin/bash
make_ssh() {
    sed -i 's/#Port 22/Port '$SSH_PORT'/' /etc/ssh/sshd_config
    sed -i 's/#PermitRootLogin.*/PermitRootLogin no/' /etc/ssh/sshd_config

    if [ ! -d /home/$USUARIO/.ssh]
    then
    mkdir /home/$USUARIO/.ssh
    #cp /root/admin/common/* /home/$USUARIO/.ssh/
    cat /root/admin/common/id_rsa.pub > /home/$USUARIO/.ssh/authorized_keys
    fi

    exec /usr/sbin/sshd

}