#!/bin/bash
set -e

mkdir -p /root/.ssh
chmod 700 /root/.ssh

if [ ! -f /root/.ssh/id_rsa ]; then
    ssh-keygen -t rsa -b 4096 -f /root/.ssh/id_rsa -N ""
fi

cp /root/.ssh/id_rsa.pub /shared/id_rsa.pub
chmod 644 /shared/id_rsa.pub

# wait a moment so slaves can consume the public key
sleep 5

# optional: pre-populate known_hosts to avoid fingerprint prompt
for host in slave1 slave2; do
    ssh-keyscan -H "$host" >> /root/.ssh/known_hosts 2>/dev/null || true
done

tail -f /dev/null
