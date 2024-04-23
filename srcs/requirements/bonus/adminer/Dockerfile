FROM debian:bookworm

RUN apt update -y && apt full-upgrade -y && apt install -y wget php-fpm php-mysql
COPY conf/php-fpm-pool.conf /etc/php/8.2/fpm/pool.d/www.conf

COPY tools/install_adminer.sh /usr/sbin/install_adminer.sh
RUN chmod +x /usr/sbin/install_adminer.sh

EXPOSE 9000

ENTRYPOINT ["/usr/sbin/install_adminer.sh"]

CMD ["/usr/sbin/php-fpm8.2", "-F"]