# !/bin/sh

nginx
php-fpm7

# launch grafana-server daemon
cd /usr/share/webapp/grafana/bin/
./grafana-server &
# /usr/share/webapp/grafana/bin/grafana-server &
sleep 3
while true
do
	sleep 1;
done