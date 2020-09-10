FROM alpine:latest

RUN apk update && apk add vim

# installing telegraf for collecting data-metrics
RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.13.3-static_linux_amd64.tar.gz && \
        tar -C . -xzf telegraf-1.13.3-static_linux_amd64.tar.gz && \
        chmod +x telegraf/* && \
        cp telegraf/telegraf /usr/bin/ && \
        rm -rf *.tar.gz* telegraf/ && \
        mkdir /etc/telegraf
# copying config file for telegraf
COPY telegraf.conf /etc/telegraf/telegraf.conf

# copying script for infinite loop to prevent exit
COPY script.sh /home/script/script.sh
# giving rights for execution
RUN chmod 777 /home/script/script.sh

# container will start on this script
ENTRYPOINT /home/script/script.sh