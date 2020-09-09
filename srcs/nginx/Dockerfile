FROM alpine:latest

# install nginx and openssl for https connexion
RUN apk update && apk add nginx openssl vim openssh

# needed to launch nginx
RUN mkdir -p /run/nginx

RUN mkdir /usr/share/webapp
RUN mv /var/lib/nginx/html/index.html /usr/share/webapp/index.html

# replace default nginx conf with ours
RUN rm /etc/nginx/conf.d/default.conf
COPY my_nginx.conf /etc/nginx/conf.d/my_nginx.conf

# SSL config
RUN mkdir /etc/nginx/ssl
COPY nginx.crt /etc/nginx/ssl/nginx.crt
COPY nginx.key /etc/nginx/ssl/nginx.key

# installing telegraf for collecting data-metrics
RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.6.3-static_linux_amd64.tar.gz
RUN tar -C . -xzf telegraf-1.6.3-static_linux_amd64.tar.gz && \
        chmod +x telegraf/* && \
        cp telegraf/telegraf /usr/bin/ && \
        rm -rf *.tar.gz* telegraf/ && \
        mkdir /etc/telegraf
# copying config file for telegraf
COPY telegraf.conf /etc/telegraf/telegraf.conf

# copying script for starting nginx and infinite loop to prevent exit
COPY script_nginx_cont.sh /home/script/script_nginx_cont.sh
# giving rights for execution
RUN chmod 777 /home/script/script_nginx_cont.sh

# container will start on this script
ENTRYPOINT /home/script/script_nginx_cont.sh
