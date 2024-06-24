#!/bin/bash

if [ -z "$CRON_SCHEDULE" ]; then
  echo "CRON_SCHEDULE is not set. Exiting."
  exit 1
fi

echo "$CRON_SCHEDULE /usr/local/bin/script.sh >> /var/log/cron.log 2>&1" > /etc/cron.d/backup-cron
chmod 0644 /etc/cron.d/backup-cron
crontab /etc/cron.d/backup-cron

printenv | grep -v "no_proxy" >> /etc/environment

cron -f