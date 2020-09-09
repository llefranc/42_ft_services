FROM alpine:latest

RUN apk update && apk add vim php7-fpm php7-opcache php7-common php7-iconv php7-json php7-gd \
    php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc \
    php7-posix php7-session php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom php7-curl \
    php7-xml php7-mbstring php7-cli php7-phar nginx libc6-compat

# install grafana
RUN mkdir -p /usr/share/webapp/grafana/
RUN wget https://dl.grafana.com/oss/release/grafana-6.6.0.linux-amd64.tar.gz
RUN tar -xzf grafana-6.6.0.linux-amd64.tar.gz --strip-components=1 -C /usr/share/webapp/grafana/
RUN rm grafana-6.6.0.linux-amd64.tar.gz

# replace default nginx conf with ours
RUN rm /etc/nginx/conf.d/default.conf
COPY my_nginx.conf /etc/nginx/conf.d/my_nginx.conf
# SSL config for nginx
COPY nginx.crt /etc/nginx/ssl/nginx.crt
COPY nginx.key /etc/nginx/ssl/nginx.key
# config file for php-fpm
RUN rm /etc/php7/php-fpm.d/www.conf
COPY www.conf /etc/php7/php-fpm.d/www.conf

# config file for grafana
RUN rm usr/share/webapp/grafana/conf/defaults.ini
COPY defaults.ini usr/share/webapp/grafana/conf/defaults.ini

# needed to launch nginx
RUN mkdir -p /run/nginx
# for launching php-fpm
RUN mkdir -p /run/php

COPY info.php usr/share/webapp/info.php

# copying script for starting nginx and infinite loop to prevent exit
COPY script_grafana_cont.sh /home/script/script_grafana_cont.sh
# giving rights for execution
RUN chmod 777 /home/script/script_grafana_cont.sh

# container will start on this script
ENTRYPOINT /home/script/script_grafana_cont.sh
