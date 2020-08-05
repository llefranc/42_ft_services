FROM alpine:latest

# installing php packages
RUN apk update && apk add vim php7-fpm php7-opcache php7-common php7-iconv php7-json php7-gd \
    php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc \
    php7-posix php7-session php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom php7-curl \
    php7-xml php7-mbstring 

# installing wordpress
RUN mkdir -p /usr/share/webapp/wordpress/
RUN wget https://wordpress.org/latest.tar.gz
RUN tar xzf latest.tar.gz --strip-components=1 -C /usr/share/webapp/wordpress/
RUN rm latest.tar.gz

# copying config file
COPY wp-config.php /usr/share/webapp/wordpress/wp-config.php

# config file for php-fpm
RUN rm /etc/php7/php-fpm.d/www.conf
COPY www.conf /etc/php7/php-fpm.d/www.conf

# for launching php-fpm
RUN mkdir -p /run/php

# copying script for infinite loop to prevent exit
COPY script_wordpress_cont.sh /home/script/script_wordpress_cont.sh
# giving rights for execution
RUN chmod 777 /home/script/script_wordpress_cont.sh

# rights for wordpress
RUN chmod 755 /usr/share/webapp/wordpress/wp-config.php

# container will start on this script
ENTRYPOINT /home/script/script_wordpress_cont.sh
