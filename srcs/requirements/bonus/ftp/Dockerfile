FROM debian:bookworm

RUN apt update && apt full-upgrade && apt install -y vsftpd

COPY conf/vsftpd.conf /etc/vsftpd.conf

RUN mkdir -p /var/run/vsftpd/empty
RUN chmod 000 /var/run/vsftpd/empty

RUN mkdir -p /var/www/html

COPY tools/set_pass.sh /usr/sbin/set_pass.sh
RUN chmod +x /usr/sbin/set_pass.sh

EXPOSE 20
EXPOSE 21

ENTRYPOINT ["/usr/sbin/set_pass.sh"]

CMD ["vsftpd"]