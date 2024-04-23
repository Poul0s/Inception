FROM debian:bookworm

RUN apt update -y && apt full-upgrade -y && apt install -y mariadb-server

COPY conf/mariadb.conf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY tool/init_db.sh /usr/bin/init_db.sh

RUN chmod +x /usr/bin/init_db.sh

EXPOSE 3306

ENTRYPOINT ["/usr/bin/init_db.sh"]

CMD ["mysqld_safe"]