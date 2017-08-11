#!/bin/sh

/bin/echo "pasv_max_port=$PASV_MAX" >> /etc/vsftpd/vsftpd.conf
/bin/echo "pasv_min_port=$PASV_MIN" >> /etc/vsftpd/vsftpd.conf
/bin/echo "pasv_address=$PASV_ADDRESS" >> /etc/vsftpd/vsftpd.conf


/usr/sbin/groupadd ftpgroup
/usr/sbin/useradd $FTP_USER -p $FTP_PASS -g ftpgroup -d /home/$FTP_USER -s /bin/false

&>/dev/null /usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf
