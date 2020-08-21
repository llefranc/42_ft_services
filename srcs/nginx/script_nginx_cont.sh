# !/bin/sh
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
while true
do
	sleep 1;
done