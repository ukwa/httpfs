FROM maven:3-jdk-7

COPY pom.xml /usr/src/httpfs/pom.xml
COPY src /usr/src/httpfs/src

WORKDIR /usr/src/httpfs

RUN mvn package -Pdist

RUN cd /opt && \
  tar xvfz /usr/src/httpfs/target/hadoop-hdfs-httpfs-0.20.2-cdh3u7-SNAPSHOT.tar.gz && \
  ln -s hadoop-hdfs-httpfs-0.20.2-cdh3u7-SNAPSHOT/ hadoop-hdfs-httpfs

WORKDIR /opt/hadoop-hdfs-httpfs

CMD ./sbin/httpfs.sh run

