#!/bin/bash
set -e

service ssh start
service apache2 start

tail -f /dev/null
