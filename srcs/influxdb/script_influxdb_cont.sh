# !/bin/sh

# launch influx daemon
influxd &
sleep 5
# create an admin
influx -execute "CREATE USER user42 WITH PASSWORD 'user42' WITH ALL PRIVILEGES"
# create a database for allowing telegraf collecting data
# influx -execute "CREATE database telegraf;" doit etre cree par telegraf

while true
do
	sleep 1;
done