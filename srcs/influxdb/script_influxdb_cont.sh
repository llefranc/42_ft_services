# !/bin/sh

# launch influx daemon
influxd &
sleep 5
# create an admin
influx -execute "CREATE USER user42 WITH PASSWORD 'user42' WITH ALL PRIVILEGES"
while true
do
	sleep 1;
done