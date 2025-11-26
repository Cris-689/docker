
#!/bin/bash
set -e

make_sudo(){
    if [ -f /etc/sudoers ]; then
        echo "${USUARIO} ALL=(ALL:ALL) ALL" >> /etc/sudoers
    fi
}