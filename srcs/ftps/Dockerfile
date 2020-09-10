FROM alpine:latest

# install nginx and openssl for https connexion
RUN apk update && apk add vim vsftpd

# needed to launch nginx
RUN mkdir -p /run/vsftpd

# replace default vsftpd conf with ours
RUN rm /etc/vsftpd/vsftpd.conf
COPY my_vsftpd.conf /etc/vsftpd/my_vsftpd.conf

RUN adduser -D user42 && echo "user42:user42" | chpasswd

RUN mkdir -p /home/user42/ftp/files \
        && chmod a-w /home/user42/ftp

# SSL config
RUN mkdir /etc/vsftpd/ssl
COPY vsftpd.crt /etc/vsftpd/ssl/vsftpd.crt
COPY vsftpd.key /etc/vsftpd/ssl/vsftpd.key

# copying script for starting ftps and infinite loop to prevent exit
COPY script.sh /home/script/script.sh
# giving rights for execution
RUN chmod 777 /home/script/script.sh

# container will start on this script
ENTRYPOINT /home/script/script.sh
