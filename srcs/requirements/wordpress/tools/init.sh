#!/bin/bash

cd /var/www/html

wp core download --allow-root --version=5.8.1 --locale=en_US
wp config create --allow-root --dbname=${DB_NAME} --dbuser=${USER1} --dbpass=${WP_PASSWORD} --dbhost=${DB_HOST}

wp core install --allow-root --url=${WP_URL} --title=${WP_TITLE} --admin_user=${WP_ADMIN_USER} --admin_password=${WP_ADMIN_PASSWORD} --admin_email=${WP_ADMIN_EMAIL}

wp user create "${WP_USER}" "dgarizado2@gmail.com" --user_pass="${WP_PASSWORD}" --role=author --allow-root

sed -i 's/^listen =.*/listen = 9000/' /etc/php/7.4/fpm/pool.d/www.conf
sed -i "/Happy publishing/i define( 'WP_CACHE', true );\ndefine( 'WP_REDIS_HOST', 'rediscontainer' );\ndefine( 'WP_REDIS_PORT', 6379 );" wp-config.php
# #redis bonus
wp plugin install redis-cache --activate --allow-root
wp redis enable --allow-root
exec /usr/sbin/php-fpm7.4 -F -R
