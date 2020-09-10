FROM alpine:latest

RUN apk update && apk add mariadb mariadb-client vim

# script that will create an user for mariadb
COPY create_user.sql /home/docker/script/create_user.sql

# config file for mariadb-server
RUN rm /etc/my.cnf.d/mariadb-server.cnf
COPY mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf

# copying script for infinite loop to prevent exit
COPY script.sh /home/script/script.sh
# giving rights for execution
RUN chmod 777 /home/script/script.sh

# creating path for mysql socket
RUN mkdir -p /run/mysqld

# giving right to mysql user for install
RUN chown mysql /var/lib/mysql

ENTRYPOINT /home/script/script.sh
