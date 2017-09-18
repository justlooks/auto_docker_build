FROM harbor.epei360.com/library/centos:6.9

ARG PKG_SERVER_URL=https://dev.mysql.com/get/Downloads/MySQL-5.7/mysql-community-server-5.7.19-1.el6.x86_64.rpm
ARG PKG_CLIENT_URL=https://dev.mysql.com/get/Downloads/MySQL-5.7/mysql-community-client-5.7.19-1.el6.x86_64.rpm
ARG PKG_COMMON_URL=https://dev.mysql.com/get/Downloads/MySQL-5.7/mysql-community-common-5.7.19-1.el6.x86_64.rpm
ARG PKG_SHELL_URL=https://repo.mysql.com/yum/mysql-tools-community/el/6/x86_64/mysql-shell-1.0.9-1.el6.x86_64.rpm
ARG PKG_LIB_URL=https://dev.mysql.com/get/Downloads/MySQL-5.7/mysql-community-libs-5.7.19-1.el6.x86_64.rpm

RUN  yum install -y $PKG_SERVER_URL $PKG_CLIENT_URL $PKG_SHELL_URL libpwquality $PKG_COMMON_URL $PKG_LIB_URL \
    && yum clean all

COPY docker-entrypoint.sh /entrypoint.sh
COPY healthcheck.sh /healthcheck.sh
RUN chmod +x /*.sh
ENTRYPOINT ["/entrypoint.sh"]
HEALTHCHECK CMD /healthcheck.sh
CMD ["mysqld","--user=mysql"]
