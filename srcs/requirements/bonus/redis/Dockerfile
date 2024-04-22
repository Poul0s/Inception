FROM debian:bookworm

RUN apt update && apt full-upgrade && apt install -y redis-server php8.2-redis

COPY conf/redis.conf /etc/redis/redis.conf

EXPOSE 6379

CMD ["redis-server"]