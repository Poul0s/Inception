FROM debian:bookworm

RUN apt update && apt full-upgrade && apt install -y wget php-fpm php-mysql
COPY conf/php-fpm-pool.conf /etc/php/8.2/fpm/pool.d/www.conf

RUN mkdir -p /var/www/html/adminer
RUN wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1-en.php && mv adminer-4.8.1-en.php /var/www/html/adminer/index.php

EXPOSE 9000

CMD ["/usr/sbin/php-fpm8.2", "-F"]