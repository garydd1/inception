#!/bin/bash

echo "ALTER USER 'root'@'localhost' IDENTIFIED BY 'MYSQL_ROOT_PASSWORD';" > /etc/mysql/tmp
echo "CREATE USER IF NOT EXISTS '$USER1'@'%' IDENTIFIED BY '$USER1_PASSWORD';" >> /etc/mysql/tmp
echo "CREATE USER IF NOT EXISTS '$USER2'@'%' IDENTIFIED BY '$USER2_PASSWORD';" >> /etc/mysql/tmp
echo "GRANT ALL PRIVILEGES ON *.* TO '$USER1'@'%' ;" >> /etc/mysql/tmp
echo "GRANT ALL PRIVILEGES ON *.* TO '$USER2'@'%' ;" >> /etc/mysql/tmp
cat /etc/mysql/tmp /docker-entrypoint-initdb.d/init.sql > /etc/mysql/tmp2

mv /etc/mysql/tmp2 /docker-entrypoint-initdb.d/init.sql

exec mysqld --init-file=/docker-entrypoint-initdb.d/init.sql
