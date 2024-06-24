FROM postgres:16

RUN apt-get update && \
    apt-get install -y cron awscli && \
    apt-get clean

COPY script.sh /usr/local/bin/script.sh
RUN chmod +x /usr/local/bin/script.sh

RUN mkdir -p /backup
COPY .aws /root/

COPY cron_start.sh cron_start.sh
RUN chmod +x /cron_start.sh
CMD ["/cron_start.sh"]
