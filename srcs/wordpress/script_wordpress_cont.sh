# !/bin/sh
nginx
php-fpm7
sleep 3

# autoinstall of wordpress with wp-cli
wp-cli --allow-root core install --path=/usr/share/webapp/wordpress --url=http://192.168.64.7:5050/wordpress \
--title="site_ft_services" --admin_user=user42 --admin_password=user42 --admin_email=xxx@xxx.fr
# creating 2 wordpress users
mysql -u user42 -puser42 -h mysql-service -D 42_ft_services -P 3306 < /home/script/create_user_wp.sql
while true
do
	sleep 1;
done