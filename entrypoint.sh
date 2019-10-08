#!/bin/sh
adduser -D $SSH_USER
echo $SSH_USER:$SSH_PASSWD | chpasswd

# create host key if not exist
if test ! -e /etc/ssh/ssh_host_ecdsa_key ; then
        ssh-keygen -t ecdsa -q -N '' -f /etc/ssh/ssh_host_ecdsa_key
fi

exec "$@"
