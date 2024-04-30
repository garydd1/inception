#!/bin/sh

# Create user and group
# if [ $(getent passwd $FTP_USR) ]; then
#     echo "User $FTP_USR already exists"
# else
adduser -D $FTP_USR
echo "User $FTP_USR created"
echo "$FTP_USR:$FTP_PWD" | chpasswd
chown -R $FTP_USR:$FTP_USR /home/dgarizad/ftp
# fi

# Start vsftpd
echo "FTP SERVER LISTENING ON 21!"
/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf