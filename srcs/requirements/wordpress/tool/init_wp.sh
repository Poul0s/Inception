#!/bin/bash

cd /var/www/html/wordpress

while ! mariadb -h mariadb -u$MYSQL_USER -p$MYSQL_PASSWORD <<< "SHOW databases;" &>/dev/null; do
	echo "waiting for mariadb"
	sleep 1
done

if [ ! -f wp-config.php ]; then
	wp --allow-root config create --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mariadb --debug=true
	echo "config created"
fi


if ! wp --allow-root core is-installed &>/dev/null; then
	wp --allow-root core multisite-install --url=$DOMAIN_NAME --title=SiteBanale --admin_user=$ADMIN_ID --admin_password=$ADMIN_PASSWORD --admin_email=$ADMIN_MAIL
	echo "admin user created"
	wp --allow-root user create $DEF_USER_ID $DEF_USER_MAIL --user_pass=$DEF_USER_PASSWORD
	echo "default user created"
fi


$@