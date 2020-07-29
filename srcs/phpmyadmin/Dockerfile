FROM alpine:latest

# installing php packages
RUN apk update && apk add vim php7-fpm php7-opcache php7-common php7-iconv php7-json php7-gd \
    php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc \
    php7-posix php7-session php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom php7-curl \
    php7-xml php7-mbstring mariadb-client

# installing phpmyadmin
RUN mkdir -p /usr/share/webapp/phpmyadmin/
RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.9.2/phpMyAdmin-4.9.2-all-languages.tar.gz
RUN tar xzf phpMyAdmin-4.9.2-all-languages.tar.gz --strip-components=1 -C /usr/share/webapp/phpmyadmin/
RUN rm phpMyAdmin-4.9.2-all-languages.tar.gz

# copying config file
COPY config.inc.php /usr/share/webapp/phpmyadmin/config.inc.php

# config file for php-fpm
RUN rm /etc/php7/php-fpm.d/www.conf
COPY www.conf /etc/php7/php-fpm.d/www.conf

# for launching php-fpm
RUN mkdir -p /run/php

# copying default php file
COPY index.php /usr/share/webapp/index.php

# copying script for infinite loop to prevent exit
COPY script_phpmyadmin_cont.sh /home/script/script_phpmyadmin_cont.sh
# giving rights for execution
RUN chmod 777 /home/script/script_phpmyadmin_cont.sh

# rights for phpmyadmin
RUN chmod 755 /usr/share/webapp/phpmyadmin/config.inc.php

# container will start on this script
ENTRYPOINT /home/script/script_phpmyadmin_cont.sh
