#!/bin/bash

cd /var/www/html/wordpress

if [ ! -f wp-config.php ]; then
	echo > wp-config.php << EOF
	<?php
		define('DB_NAME', '${MYSQL_DATABASE}');
		define('DB_USER', '${MYSQL_USER}');
		define('DB_PASSWORD', '${MYSQL_PASSWORD}');
		define('DB_HOST', 'mariadb:3306');
		define('DB_CHARSET', 'utf8');
		define('DB_COLLATE', '');
		$table_prefix = 'wp_';
		define('WP_DEBUG', false);
		if ( !defined('ABSPATH') )
			define('ABSPATH', dirname(__FILE__) . '/');
		require_once(ABSPATH . 'wp-settings.php');
EOF
	echo "Wordpress config céée.";
fi

$@