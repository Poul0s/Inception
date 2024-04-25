FROM debian:bookworm
# https://adamtheautomator.com/squid-proxy/
RUN apt update -y && apt full-upgrade -y && apt install -y squid apache2-utils

COPY conf/squid.conf /etc/squid/squid.conf
COPY conf/domain_blacklist.txt /etc/squid/domain_blacklist.txt
COPY tools/init.sh /usr/sbin/init.sh
RUN chmod +x /usr/sbin/init.sh

EXPOSE 8888

ENTRYPOINT ["/usr/sbin/init.sh"]

CMD ["squid", "-N"]