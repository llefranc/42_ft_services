FROM alpine:latest

RUN apk update && apk add mariadb mariadb-client vim

# script that will create an user for mariadb
COPY create_user.sql /home/docker/script/create_user.sql

# config file for mariadb-server
RUN rm /etc/my.cnf.d/mariadb-server.cnf
COPY mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf

# copying script for infinite loop to prevent exit
COPY script_mysql_cont.sh /home/script/script_mysql_cont.sh
# giving rights for execution
RUN chmod 777 /home/script/script_mysql_cont.sh

# creating path for mysql socket
RUN mkdir -p /run/mysqld

# installing telegraf for collecting data-metrics
RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.6.3-static_linux_amd64.tar.gz
RUN tar -C . -xzf telegraf-1.6.3-static_linux_amd64.tar.gz && \
        chmod +x telegraf/* && \
        cp telegraf/telegraf /usr/bin/ && \
        rm -rf *.tar.gz* telegraf/ && \
        mkdir /etc/telegraf
# copying config file for telegraf
COPY telegraf.conf /etc/telegraf/telegraf.conf

# giving right to mysql user for install
RUN chown mysql /var/lib/mysql

ENTRYPOINT /home/script/script_mysql_cont.sh
