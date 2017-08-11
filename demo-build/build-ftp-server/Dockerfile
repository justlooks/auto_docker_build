FROM harbor.myrepo.com/library/baseimage:v1.0

ENV FTP_USER=foo \
    FTP_PASS=foo123 \
    PASV_ADDRESS=xxx.com \
    PASV_MIN=21100 \
    PASV_MAX=21110

COPY vsftpd.sh /usr/sbin/
RUN yum install -y vsftpd && chkconfig vsftpd on && chmod +x /usr/sbin/vsftpd.sh \
    && echo "background=NO" >> /etc/vsftpd/vsftpd.conf \
    && sed -i "s/#chroot_local_user=YES/chroot_local_user=YES/" /etc/vsftpd/vsftpd.conf
ENTRYPOINT ["/usr/sbin/vsftpd.sh"]
