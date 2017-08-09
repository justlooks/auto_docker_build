FROM harbor.epei360.com/library/alpine:v1.0

ENV FTP_USER=foo \
    FTP_PASS=foo123 \
    PASV_ADDRESS=tqmall.com \
    PASV_MIN=21100 \
    PASV_MAX=21110

RUN echo "http://dl-1.alpinelinux.org/alpine/v3.6/main" > /etc/apk/repositories \
  && echo "http://dl-2.alpinelinux.org/alpine/v3.6/main" >> /etc/apk/repositories \
  && echo "http://dl-3.alpinelinux.org/alpine/v3.6/main" >> /etc/apk/repositories \
  && echo "http://dl-4.alpinelinux.org/alpine/v3.6/main" >> /etc/apk/repositories \
  && echo "http://dl-5.alpinelinux.org/alpine/v3.6/main" >> /etc/apk/repositories

RUN  apk --update --no-cache add vsftpd

RUN echo "local_enable=YES" >> /etc/vsftpd/vsftpd.conf \
  && echo "chroot_local_user=YES" >> /etc/vsftpd/vsftpd.conf \
  && echo "allow_writeable_chroot=YES" >> /etc/vsftpd/vsftpd.conf \
  && echo "background=NO" >> /etc/vsftpd/vsftpd.conf \
  && echo "ftpd_banner=Welcome to FTP Server" >> /etc/vsftpd/vsftpd.conf \
  && echo "dirmessage_enable=YES" >> /etc/vsftpd/vsftpd.conf \
  && echo "max_clients=10" >> /etc/vsftpd/vsftpd.conf \
  && echo "max_per_ip=5" >> /etc/vsftpd/vsftpd.conf \
  && echo "write_enable=YES" >> /etc/vsftpd/vsftpd.conf \
  && echo "local_umask=022" >> /etc/vsftpd/vsftpd.conf \
  && echo "passwd_chroot_enable=yes" >> /etc/vsftpd/vsftpd.conf \
  && echo "pasv_enable=Yes" >> /etc/vsftpd/vsftpd.conf \
  && echo "listen_ipv6=NO" >> /etc/vsftpd/vsftpd.conf \
  && echo "seccomp_sandbox=NO" >> /etc/vsftpd/vsftpd.conf \
  && sed -i "s/anonymous_enable=YES/anonymous_enable=NO/" /etc/vsftpd/vsftpd.conf

COPY vsftpd.sh /usr/sbin/

RUN chmod +x /usr/sbin/vsftpd.sh


CMD /usr/sbin/vsftpd.sh
