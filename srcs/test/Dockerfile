FROM alpine:latest

# install nginx and openssl for https connexion
RUN apk update && apk add nginx openssl vim openssh

# needed to launch nginx
RUN mkdir -p /run/nginx

RUN mkdir /usr/share/webapp

# replace default nginx conf with ours
RUN rm /etc/nginx/conf.d/default.conf
COPY my_nginx.conf /etc/nginx/conf.d/my_nginx.conf

# SSL config
RUN mkdir /etc/nginx/ssl
# generating ssl keys
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt \
	-subj "/C=FR/ST=ILE_DE_FRANCE/L=PARIS/O=ECOLE_42/OU=STUDENT/CN=FT_SERVER/emailAddress=test@xxx.fr"

# copying script for starting nginx and infinite loop to prevent exit
COPY script_nginx_cont.sh /home/script/script_nginx_cont.sh
# giving rights for execution
RUN chmod 777 /home/script/script_nginx_cont.sh

# installing php packages
RUN apk update && apk add vim php7-fpm php7-opcache php7-common php7-iconv php7-json php7-gd \
    php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc \
    php7-posix php7-session php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom php7-curl \
    php7-xml php7-mbstring 

# config file for php-fpm
RUN rm /etc/php7/php-fpm.d/www.conf
COPY www.conf /etc/php7/php-fpm.d/www.conf

# for launching php-fpm
RUN mkdir -p /run/php

RUN mkdir -p /usr/share/webapp/test
RUN mv /var/lib/nginx/html/index.html /usr/share/webapp/test/index.html

COPY test.php /usr/share/webapp/test/test.php

# container will start on this script
ENTRYPOINT /home/script/script_nginx_cont.sh
