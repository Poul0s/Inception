FROM debian:bookworm

RUN apt update -y && apt full-upgrade -y && apt install -y nodejs

RUN mkdir -p /var/www/html
COPY tools/pong /root/pong
COPY tools/server.js /root/server.js
COPY tools/init.sh /sbin/init.sh
RUN chmod +x /sbin/init.sh

EXPOSE 8080

ENTRYPOINT ["/sbin/init.sh"]

CMD ["node", "/root/server.js"]