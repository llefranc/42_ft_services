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

# generating ssl keys
# RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt \
# 	-subj "/C=FR/ST=ILE_DE_FRANCE/L=PARIS/O=ECOLE_42/OU=STUDENT/CN=FT_SERVER/emailAddress=test@xxx.fr"

# copying script for starting nginx and infinite loop to prevent exit
COPY script_nginx_cont.sh /home/script/script_nginx_cont.sh
# giving rights for execution
RUN chmod 777 /home/script/script_nginx_cont.sh

# container will start on this script
ENTRYPOINT /home/script/script_nginx_cont.sh
