# !/bin/sh

# rights for ftps
chown "nobody:nogroup" /home/user42/ftp
chown "user42:user42" /home/user42/ftp/files
# test file for download
echo "this is a test file" > /home/user42/ftp/files/test.txt

# launch ftps deamon
/usr/sbin/vsftpd /etc/vsftpd/my_vsftpd.conf &
while true
do
	sleep 1;
done