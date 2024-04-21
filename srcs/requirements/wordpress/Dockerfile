FROM debian:bookworm

RUN apt update && apt full-upgrade && apt install -y wget php-fpm php-mysql mariadb-client

RUN mkdir -p /var/www/html
RUN wget https://fr.wordpress.org/wordpress-6.5.2-fr_FR.tar.gz && tar -xvf wordpress-6.5.2-fr_FR.tar.gz && rm wordpress-6.5.2-fr_FR.tar.gz && mv wordpress /var/www/html
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar /usr/sbin/wp
COPY conf/php-fpm-pool.conf /etc/php/8.2/fpm/pool.d/www.conf

COPY tool/init_wp.sh /usr/bin/init_wp.sh
RUN chmod +x /usr/bin/init_wp.sh

EXPOSE 9000

ENTRYPOINT ["/usr/bin/init_wp.sh"]

CMD ["/usr/sbin/php-fpm8.2", "-F"]