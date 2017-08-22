FROM harbor.epei360.com/library/hch_baseimage:v1.0
ENV JAVA_HOME /usr/jdk1.8.0_144

RUN yum install tar gzip -y && ls -l /usr && curl -O -L -b oraclelicense=accept-securebackup-cookie \
  "http://download.oracle.com/otn-pub/java/jdk/8u144-b01/090f390dda5b47b9b721c7dfaa008135/server-jre-8u144-linux-x64.tar.gz" \
    && tar xvf server-jre-8u144-linux-x64.tar.gz -C /usr/ \
    && ln -s $JAVA_HOME /usr/java \
    && rm -rf $JAVA_HOME/src.zip $JAVA_HOME/javafx-src.zip $JAVA_HOME/man ./server-jre-8u144-linux-x64.tar.gz

ENV TOMCAT_MAJOR 7
ENV TOMCAT_VERSION 7.0.81

RUN curl -O http://mirrors.cnnic.cn/apache/tomcat/tomcat-${TOMCAT_MAJOR}/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz \
    && tar xvf apache-tomcat-${TOMCAT_VERSION}.tar.gz -C /opt/ \
    && rm -f apache-tomcat-${TOMCAT_VERSION}.tar.gz

ENV CATALINA_HOME /opt/apache-tomcat-${TOMCAT_VERSION}
ENV PATH $CATALINA_HOME/bin:$PATH


# sh removes env vars it doesn't support (ones with periods)
# https://github.com/docker-library/tomcat/issues/77
#       && find ./bin/ -name '*.sh' -exec sed -ri 's|^#!/bin/sh$|#!/usr/bin/env bash|' '{}' +

# verify Tomcat Native is working properly

EXPOSE 8080
CMD ["catalina.sh", "run"]
