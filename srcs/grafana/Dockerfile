FROM alpine:latest

# installing grafana
RUN apk update && apk add grafana --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/

# copying config files for grafana
COPY sources.yaml /usr/share/grafana/conf/provisioning/datasources/sources.yaml
RUN mkdir /usr/share/grafana/conf/provisioning/dashboards/mine
COPY dashboards/*.json /usr/share/grafana/conf/provisioning/dashboards/mine/
COPY config.yaml /usr/share/grafana/conf/provisioning/dashboards/config.yaml

# copying script for starting nginx and infinite loop to prevent exit
COPY script_grafana_cont.sh /home/script/script_grafana_cont.sh
# giving rights for execution
RUN chmod 777 /home/script/script_grafana_cont.sh

# container will start on this script
ENTRYPOINT /home/script/script_grafana_cont.sh
