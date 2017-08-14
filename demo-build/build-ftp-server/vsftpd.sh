#!/bin/sh

#/bin/echo "pasv_max_port=$PASV_MAX" >> /etc/vsftpd/vsftpd.conf
#/bin/echo "pasv_min_port=$PASV_MIN" >> /etc/vsftpd/vsftpd.conf
#/bin/echo "pasv_address=$PASV_ADDRESS" >> /etc/vsftpd/vsftpd.conf


/usr/sbin/groupadd $FTP_USER
/usr/sbin/useradd -g $FTP_USER -d /var/ftp/pub -s /sbin/nologin $FTP_USER

echo "$FTP_USER:$FTP_PASS" | /usr/sbin/chpasswd
chown $FTP_USER:$FTP_USER /var/ftp/pub -R

&>/dev/null /usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf
