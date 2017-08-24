FROM harbor.epei360.com/library/centos:6.9

ENV JAVA_HOME /opt/jdk1.8.0_144

RUN curl -O -L -b oraclelicense=accept-securebackup-cookie \
  "http://download.oracle.com/otn-pub/java/jdk/8u144-b01/090f390dda5b47b9b721c7dfaa008135/server-jre-8u144-linux-x64.tar.gz" \
  && tar xvf server-jre-8u144-linux-x64.tar.gz -C /opt/ \
  && ln -s $JAVA_HOME /opt/java \
  && rm -rf $JAVA_HOME/src.zip $JAVA_HOME/javafx-src.zip $JAVA_HOME/man ./server-jre-8u144-linux-x64.tar.gz \
  && curl -O https://download.elasticsearch.org/elasticsearch/release/org/elasticsearch/distribution/rpm/elasticsearch/2.2.0/elasticsearch-2.2.0.rpm \
  && yum install -y elasticsearch-2.2.0.rpm \
  && rm -f elasticsearch-2.2.0.rpm

WORKDIR /usr/share/elasticsearch
USER elasticsearch
CMD ["bin/elasticsearch", "-Des.default.path.conf=/etc/elasticsearch", "-Des.default.path.logs=/var/log/elasticsearch", "-Des.default.path.data=/var/lib/elasticsearch"]
