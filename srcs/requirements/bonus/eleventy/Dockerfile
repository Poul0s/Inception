FROM debian:bookworm

RUN apt update && apt full-upgrade && apt install -y nodejs npm

RUN mkdir -p /var/www/html
RUN cd /root && npm install @11ty/eleventy -g --save-dev
RUN cd /root && echo '<!doctype html><title>Page title</title><p>Hi</p>' > index.html

EXPOSE 8080

CMD ["npx", "@11ty/eleventy", "--serve", "--input=/root/", "--output=/root/_site/"]