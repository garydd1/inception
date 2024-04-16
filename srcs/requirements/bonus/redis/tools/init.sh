#!bin/bash

cd /etc/redis

sed -i "s/^bind 127.*/#bind 0.0.0.0/" redis.conf

exec redis-server --bind 0.0.0.0 --protected-mode no
