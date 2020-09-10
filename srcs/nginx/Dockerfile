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

# copying script for starting nginx and infinite loop to prevent exit
COPY script.sh /home/script/script.sh
# giving rights for execution
RUN chmod 777 /home/script/script.sh

# container will start on this script
ENTRYPOINT /home/script/script.sh
