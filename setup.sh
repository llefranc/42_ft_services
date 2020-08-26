# !bin/bash

# linking our docker client to minikube environnement
eval $(minikube docker-env)

# enabling and configuring metallb
kubectl apply -f srcs/metallb/metallb.yaml
kubectl apply -f srcs/metallb/metallb-configmap.yaml
printf "\e[0;32m[metallb configured]\e[0m\n\n"

# building all the images
docker build -t wordpress_img srcs/wordpress/.
printf "\e[0;32m[wordpress image built]\e[0m\n\n"
docker build -t nginx_img srcs/nginx/.
printf "\e[0;32m[nginx image built]\e[0m\n\n"
docker build -t phpmyadmin_img srcs/phpmyadmin/.
printf "\e[0;32m[phpmyadmin image built]\e[0m\n\n"
docker build -t mysql_img srcs/mysql/.
printf "\e[0;32m[mysql image built]\e[0m\n\n"
docker build -t influxdb_img srcs/influxdb/.
printf "\e[0;32m[influxdb image built]\e[0m\n\n"

# creating deployment / services / persistent volume claim
printf "\e[0;32m[beginning creation of services / deployments / persistent volume claim]\e[0m\n"
kubectl apply -f srcs/mysql/mysql.yaml
kubectl apply -f srcs/influxdb/influxdb.yaml
kubectl apply -f srcs/phpmyadmin/phpmyadmin.yaml
# need to sleep 15 sec for waiting end of config of mysql so wordpress can autoinstall automatically
printf "\e[0;32m[sleeping 15 sec for waiting end of configuration of mysql]\e[0m\n"
sleep 15
kubectl apply -f srcs/wordpress/wordpress.yaml
kubectl apply -f srcs/nginx/nginx.yaml
printf "\e[0;32m[all services / deployments / persistent volume claim created]\e[0m\n\n"

# enabling dashboard
minikube addons enable dashboard
kubectl apply -f srcs/metallb/dashboard-service.yaml
printf "\e[0;32m[dashboard enabled]\e[0m\n"