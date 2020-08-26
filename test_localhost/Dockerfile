FROM alpine:latest

# --------------- NGINX -----------------
# install nginx and openssl for https connexion
RUN apk update && apk add nginx openssl vim openssh

# needed to launch nginx
RUN mkdir -p /run/nginx

RUN mkdir /usr/share/webapp
RUN mv /var/lib/nginx/html/index.html /usr/share/webapp/index.html

# replace default nginx conf with ours
RUN rm /etc/nginx/conf.d/default.conf
COPY nginx/my_nginx.conf /etc/nginx/conf.d/my_nginx.conf

# SSL config
RUN mkdir /etc/nginx/ssl

# generating ssl keys
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt \
	-subj "/C=FR/ST=ILE_DE_FRANCE/L=PARIS/O=ECOLE_42/OU=STUDENT/CN=FT_SERVER/emailAddress=test@xxx.fr"


# --------------- MYSQL -----------------
RUN apk update && apk add mariadb mariadb-client

# script that will create an user for mariadb
COPY mysql/create_user.sql /home/docker/script/create_user.sql

# config file for mariadb-server
# RUN rm /etc/my.cnf.d/mariadb-server.cnf
# COPY mysql/mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf

# creating path for mysql socket
RUN mkdir -p /run/mysqld

# giving right to mysql user for install
RUN chown mysql /var/lib/mysql


# --------------- PHPMYADMIN -----------------
# installing php packages
RUN apk update && apk add php7-fpm php7-opcache php7-common php7-iconv php7-json php7-gd \
    php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc \
    php7-posix php7-session php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom php7-curl \
    php7-xml php7-mbstring 

# installing phpmyadmin
RUN mkdir -p /usr/share/webapp/phpmyadmin/
RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.9.2/phpMyAdmin-4.9.2-all-languages.tar.gz
RUN tar xzf phpMyAdmin-4.9.2-all-languages.tar.gz --strip-components=1 -C /usr/share/webapp/phpmyadmin/
RUN rm phpMyAdmin-4.9.2-all-languages.tar.gz

# copying config file
COPY phpmyadmin/config.inc.php /usr/share/webapp/phpmyadmin/config.inc.php
# rights for phpmyadmin
RUN chmod 755 /usr/share/webapp/phpmyadmin/config.inc.php

# config file for php-fpm
RUN rm /etc/php7/php-fpm.d/www.conf
COPY phpmyadmin/www.conf /etc/php7/php-fpm.d/www.conf

# for launching php-fpm
RUN mkdir -p /run/php


# --------------- WORDPRESS -----------------
# installing wordpress
RUN mkdir -p /usr/share/webapp/wordpress/
RUN wget https://wordpress.org/latest.tar.gz
RUN tar xzf latest.tar.gz --strip-components=1 -C /usr/share/webapp/wordpress/
RUN rm latest.tar.gz

# copying config file
COPY wordpress/wp-config.php /usr/share/webapp/wordpress/wp-config.php
# rights for wordpress
RUN chmod 755 /usr/share/webapp/wordpress/wp-config.php

# auto-install of wordpress using wp-cli
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar & mv wp-cli.phar /usr/bin/wp-cli
RUN apk add php7-cli php7-phar
# RUN wp-cli --allow-root core install --path=/usr/share/webapp/wordpress --url=wordpress --title="site_ft_services"\
#     --admin_user=user42 --admin_password=user42 --admin_email=xxx@xxx.fr

# --------------- GRAFANA -----------------
# installing GRAFANA
RUN apk update && apk add libc6-compat
# install grafana
RUN mkdir -p /usr/share/webapp/grafana/
RUN wget https://dl.grafana.com/oss/release/grafana-6.6.0.linux-amd64.tar.gz
RUN tar -xzf grafana-6.6.0.linux-amd64.tar.gz --strip-components=1 -C /usr/share/webapp/grafana/
RUN rm grafana-6.6.0.linux-amd64.tar.gz

# config file for grafana
RUN rm usr/share/webapp/grafana/conf/defaults.ini
COPY grafana/defaults.ini usr/share/webapp/grafana/conf/defaults.ini

# --------------- SCRIPT -----------------
# copying script for starting nginx and infinite loop to prevent exit
COPY script_cont.sh /home/script/script_cont.sh
# giving rights for execution
RUN chmod 777 /home/script/script_cont.sh

# nginx port
EXPOSE 80
# php-fpm port
EXPOSE 5000
# garfana port
EXPOSE 3001

# container will start on this script
ENTRYPOINT /home/script/script_cont.sh