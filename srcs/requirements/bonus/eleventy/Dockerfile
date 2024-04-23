FROM debian:bookworm

RUN apt update -y && apt full-upgrade -y && apt install -y nodejs npm

RUN mkdir -p /var/www/html/eleventy
RUN cd /root && npm install @11ty/eleventy -g --save-dev
RUN cd /root && echo '<!doctype html><title>Page title</title><p>Hi</p>' > index.html

EXPOSE 8080

CMD ["npx", "@11ty/eleventy", "--serve", "--input=/root/", "--output=/var/www/html/eleventy/"]