#!bin/bash

service vsftpd start

adduser --gecos "" --disabled-login --disabled-password $FTP_USR

echo "$FTP_USR:$FTP_PWD" | /usr/sbin/chpasswd

echo "$FTP_USR" | tee -a /etc/vsftpd.userlist 


mkdir /home/$FTP_USR/ftp


chown nobody:nogroup /home/$FTP_USR/ftp
chmod a-w /home/$FTP_USR/ftp

mkdir /home/$FTP_USR/ftp/files
chown $FTP_USR:$FTP_USR /home/$FTP_USR/ftp/files

sed -i -r "s/#write_enable=YES/write_enable=YES/1"   /etc/vsftpd.conf
sed -i -r "s/#chroot_local_user=YES/chroot_local_user=YES/1"   /etc/vsftpd.conf
# sed -i "s/listen=NO/listen=YES/" /etc/vsftpd.conf

echo "
local_enable=YES
allow_writeable_chroot=YES
pasv_enable=YES
local_root=/home/sami/ftp
pasv_min_port=21100
pasv_max_port=21110
userlist_file=/etc/vsftpd.userlist" >> /etc/vsftpd.conf

service vsftpd stop
echo "FTP SERVER LISTENING!"
/usr/sbin/vsftpd