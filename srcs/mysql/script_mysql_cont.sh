# !/bin/sh

# install mariadb
/usr/bin/mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
# launch mariadb server in background
/usr/bin/mysqld --user=root &

# create one user and one database
sleep 2
mysql < /home/docker/script/create_user.sql
while true
do
	sleep 1;
done