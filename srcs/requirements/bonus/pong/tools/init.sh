#!/bin/bash

if [ ! -f /var/www/html/pong ]; then
	cp -R /root/pong /var/www/html/pong
fi

cd /var/www/html/pong

$@