FROM harbor.epei360.com/library/hch_baseimage:v1.0

ENV FTP_USER=foo \
    FTP_PASS=foo123 \
    PASV_ADDRESS=ftp-server.demo \
    PASV_MIN=21100 \
    PASV_MAX=21110

COPY vsftpd.sh /usr/sbin/
RUN yum install -y vsftpd && chkconfig vsftpd on && chmod +x /usr/sbin/vsftpd.sh \
    && echo "background=NO" >> /etc/vsftpd/vsftpd.conf \
    && sed -i -e "s/#chroot_local_user=YES/chroot_local_user=YES/" \
       -e "s/anonymous_enable=YES/anonymous_enable=NO/" \
       -e "s/#chroot_list_enable=YES/chroot_list_enable=YES/" \
       -e "s|#chroot_list_file=/etc/vsftpd/chroot_list|chroot_list_file=/etc/vsftpd/user_list|" \
       /etc/vsftpd/vsftpd.conf
ENTRYPOINT ["/usr/sbin/vsftpd.sh"]
