#!/bin/bash


if [ ! -d /var/www/html/wordpress ]; then
	wp --allow-root core download --path=/var/www/html/wordpress
	echo "Downloaded wordpress"
	ls -la /var/www/html
fi

cd /var/www/html/wordpress

while ! mariadb -h mariadb -u$MYSQL_USER -p$MYSQL_PASSWORD <<< "SHOW databases;" &>/dev/null; do
	echo "waiting for mariadb"
	sleep 1
done

if [ ! -f wp-config.php ]; then
	wp --allow-root config create --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mariadb
fi

wp --allow-root config set WP_CACHE true --raw
wp --allow-root config set WP_CACHE_KEY_SALT "$DOMAIN_NAME"

if ! wp --allow-root core is-installed &>/dev/null; then
	wp --allow-root core multisite-install --url=$DOMAIN_NAME --title=SiteBanale --admin_user=$ADMIN_ID --admin_password=$ADMIN_PASSWORD --admin_email=$ADMIN_MAIL
	echo "admin user created"
	wp --allow-root user create $DEF_USER_ID $DEF_USER_MAIL --user_pass=$DEF_USER_PASSWORD
fi

if ! wp --allow-root plugin is-installed wp-redis &>/dev/null; then
	wp --allow-root plugin install wp-redis
	sed -i 's/127.0.0.1/redis/g' wp-content/plugins/wp-redis/object-cache.php
	wp --allow-root plugin activate wp-redis
fi


$@