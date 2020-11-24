# Ft_services (@42Paris)

System administration and networking project

![Alt text](https://github.com/lucaslefrancq/42-06_minishell/blob/master/minishell_example.png)

## About

Ft_services is the 7th project of the mandatory part of the cursus.
It's about using kubernetes and docker to run a cluster with several services.
We had to creates our own dockerfile on Alpine for each service, and then create
a kubernetes-pod and a kubernetes-service for each service.

- The different services are :
    - A web server (Nginx) that can be access in http / https / ssh
	- A FTPS server
    - Phpmyadmin, Mysql and Wordpress all working together
    - Grafana, influxDB and Telegraf all working together

- Here is the [subject][1]

`Requirement for running this project : Docker and Minikube`

### Building and running the project

1. Install [Docker][2] and [Minikube][3]

2. Download/Clone this repo

        git clone https://github.com/lucaslefrancq/42-06_minishell

2. `cd` into the root directory, and run setup.sh. This will start minikube, build all
	the docker images and creates all the pods in the kubernetes cluster.

        cd 42-05_ft_services
        ./setup.sh

## Sources

- [Full tutorial for Docker and Kubernetes][4]
- [Comprendre le clustering et load balancing (FR)][5]
- [Cours sur kubernetes (FR)][6]
- [Use local images in kubernetes from Docker][7]
- [Use local images in kubernetes from Docker (2)][8]
- [Deploying PHP-FPM and NGINX in kubernetes][9]
- [Deploying PHP/Mysql in kubernetes][10]
- [Examples of containers build with Alpine][11]
- [Using php as web server][12]
- [Using MetalLB as loadbalancer][13]
- [Launching ft_services with VM (for 42 students during covid-19 pandemy)][14]

[1]: https://github.com/lucaslefrancq/42-05_ft_services/blob/main/ft_services.en.subject.pdf
[2]: https://docs.docker.com/get-docker/
[3]: https://kubernetes.io/fr/docs/tasks/tools/install-minikube/
[4]: https://www.youtube.com/watch?v=jPdIRX6q4jA&list=PLy7NrYWoggjwPggqtFsI_zMAwvG0SqYCb&ab_channel=TechWorldwithNana
[5]: https://www.youtube.com/watch?v=9EoqLdmZCTU&ab_channel=Cookieconnect%C3%A9
[6]: https://devopssec.fr/article/cours-complet-apprendre-orchestrateur-kubernetes-k8s
[7]: https://stackoverflow.com/questions/40144138/pull-a-local-image-to-run-a-pod-in-kubernetes
[8]: https://stackoverflow.com/questions/53714508/is-possible-to-use-local-image-into-pods-yaml-in-kubernetes
[9]: https://www.digitalocean.com/community/tutorials/how-to-deploy-a-php-application-with-kubernetes-on-ubuntu-16-04
[10]: https://medium.com/faun/deploy-your-first-scaleable-php-mysql-web-application-in-kubernetes-33ed7ab66595
[11]: https://github.com/container-examples
[12]: https://www.php.net/manual/en/features.commandline.webserver.php
[13]: https://medium.com/@shoaib_masood/metallb-network-loadbalancer-minikube-335d846dfdbe
[14]: https://www.notion.so/Ft_services-VM-852d4f9b0d9a42c1a2de921e4a2ac417