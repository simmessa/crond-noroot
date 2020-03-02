#!/bin/bash

set -e

if [ -z '$TIMEZONE' ]; then
echo '···································································································'
echo 'NO TIMEZONE SET - starting with Default values'
echo 'Accepted values: America/Montevideo | America/El_Salvador'
echo '···································································································'
else
echo '···································································································'
echo 'TIMEZONE ALREADY SET: ' $TIMEZONE
echo '···································································································'
cat /usr/share/zoneinfo/$TIMEZONE > /etc/localtime && \
echo $TIMEZONE > /etc/timezone
fi
echo 'STARTING...'
exec /usr/bin/go-tasks --allow-unprivileged --no-auto --verbose --include=/opt/crontabs --configfile=/opt/config/config.ini
