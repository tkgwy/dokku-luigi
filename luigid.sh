#!/bin/sh

sed "s#__HISTORY_DB__#$HISTORY_DB#g" /etc/luigi/client.cfg.template > /etc/luigi/client.cfg
exec /usr/local/bin/luigid --port=5000 >>/var/log/luigid/luigid.log 2>&1
