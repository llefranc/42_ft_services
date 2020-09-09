FROM alpine:latest

RUN apk update && apk add vim influxdb

# creating folder for influxdb data and giving rights
RUN mkdir -p /var/lib/influxdb
RUN chown influxdb:influxdb /var/lib/influxdb
# copying config file for influxdb
RUN mkdir -p /etc/influxdb
COPY influxdb.conf /etc/influxdb/influxdb.conf
RUN chown influxdb:influxdb /etc/influxdb/*

# copying script for starting nginx and infinite loop to prevent exit
COPY script_influxdb_cont.sh /home/script/script_influxdb_cont.sh
# giving rights for execution
RUN chmod 777 /home/script/script_influxdb_cont.sh

# container will start on this script
ENTRYPOINT /home/script/script_influxdb_cont.sh
