FROM alpine:latest

RUN apk update && apk add mariadb mariadb-client

# script that will create an user for mariadb
COPY create_user.sql /home/docker/script/create_user.sql

# copying script for infinite loop to prevent exit
COPY script_mysql_cont.sh /home/script/script_mysql_cont.sh
# giving rights for execution
RUN chmod 777 /home/script/script_mysql_cont.sh

# creating path for mysql socket
RUN mkdir -p /run/mysqld

# giving right to mysql user for install
RUN chown mysql /var/lib/mysql

ENTRYPOINT /home/script/script_mysql_cont.sh
