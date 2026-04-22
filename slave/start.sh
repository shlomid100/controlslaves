#!/bin/bash
set -e

mkdir -p /var/run/sshd
mkdir -p /root/.ssh
chmod 700 /root/.ssh

while [ ! -f /shared/id_rsa.pub ]; do
    sleep 1
done

cat /shared/id_rsa.pub > /root/.ssh/authorized_keys
chmod 600 /root/.ssh/authorized_keys

service ssh start
service apache2 start

tail -f /dev/null
