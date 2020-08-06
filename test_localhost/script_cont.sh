# !/bin/bash
# starting nginx
nginx
# generating keys for ssh
ssh-keygen -A
# create a new user with no passwordz
adduser -D user42
# change the password of the new user
echo "user42:user42" | chpasswd
# launch ssh deamon
/usr/sbin/sshd

# install mariadb
/usr/bin/mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
# launch mariadb server in background
/usr/bin/mysqld --user=root &
# create one user and one database
sleep 2
mysql < /home/docker/script/create_user.sql

# launching php-fpm7
php-fpm7

while true
do
	sleep 1;
done