FROM centos:7.5.1804
MAINTAINER solvaysphere "hpuswl@163.com"

# set environment
ENV BASE_DIR="/home/sentinel" \
    CLASSPATH=".:/home/sentinel/conf:$CLASSPATH" \
    JAVA_HOME="/usr/lib/jvm/java-1.8.0-openjdk" \
    SENTINEL_USER="sentinel" \
    JAVA="/usr/lib/jvm/java-1.8.0-openjdk/bin/java" \
    JVM_XMS="1g" \
    JVM_XMX="1g" \
    JVM_XMN="512m" \
    JVM_MS="128m" \
    JVM_MMS="320m" \
    SENTINEL_DEBUG="n" \
    TOMCAT_ACCESSLOG_ENABLED="false" \
    TIME_ZONE="Asia/Shanghai"

ARG SENTINEL_VERSION=1.8.2
ARG HOT_FIX_FLAG=""

RUN mkdir -p $BASE_DIR/conf

WORKDIR $BASE_DIR

RUN set -x \
    && yum update -y \
    && yum install -y java-1.8.0-openjdk java-1.8.0-openjdk-devel wget iputils nc  vim libcurl
RUN wget  https://github.com/alibaba/Sentinel/releases/download/${SENTINEL_VERSION}${HOT_FIX_FLAG}/sentinel-dashboard-${SENTINEL_VERSION}.jar -P /home/sentinel \
    && mv /home/sentinel/sentinel-dashboard-${SENTINEL_VERSION}.jar /home/sentinel/sentinel-dashboard.jar
RUN yum autoremove -y wget \
    && ln -snf /usr/share/zoneinfo/$TIME_ZONE /etc/localtime && echo $TIME_ZONE > /etc/timezone \
    && yum clean all

ADD bin/docker-startup.sh bin/docker-startup.sh
ADD conf/application.properties conf/application.properties

RUN chmod +x bin/docker-startup.sh

EXPOSE 8080
ENTRYPOINT ["bin/docker-startup.sh"]
