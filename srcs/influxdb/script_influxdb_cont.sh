# !/bin/sh

# launch influx daemon
influxd &
sleep 5
# create an admin
influx -execute "CREATE USER user42 WITH PASSWORD 'user42' WITH ALL PRIVILEGES"
# create a database for allowing telegraf collecting data
influx -execute "CREATE database grafana;"
influx -execute "CREATE database influxdb;"
influx -execute "CREATE database mysql;"
influx -execute "CREATE database nginx;"
influx -execute "CREATE database phpmyadmin;"
influx -execute "CREATE database wordpress;"

while true
do
	sleep 1;
done