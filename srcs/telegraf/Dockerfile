FROM alpine:latest

RUN apk update && apk add vim

# installing telegraf for collecting data-metrics
RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.6.3-static_linux_amd64.tar.gz
RUN tar -C . -xzf telegraf-1.6.3-static_linux_amd64.tar.gz && \
        chmod +x telegraf/* && \
        cp telegraf/telegraf /usr/bin/ && \
        rm -rf *.tar.gz* telegraf/ && \
        mkdir /etc/telegraf
# copying config file for telegraf
COPY telegraf.conf /etc/telegraf/telegraf.conf

# copying script for infinite loop to prevent exit
COPY script_telegraf_cont.sh /home/script/script_telegraf_cont.sh
# giving rights for execution
RUN chmod 777 /home/script/script_telegraf_cont.sh

# container will start on this script
ENTRYPOINT /home/script/script_telegraf_cont.sh