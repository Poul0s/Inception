FROM debian:bookworm

RUN apt update -y && apt full-upgrade -y && apt install -y nginx openssl

RUN mkdir -p /etc/nginx/ssl /var/run/nginx

RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=psalame.42.fr/UID=psalame"

RUN chown -R www-data:www-data /var/www
RUN chmod -R 755 /var/www

COPY conf/nginx.conf /etc/nginx/conf.d

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]