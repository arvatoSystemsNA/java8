FROM debian:wheezy

MAINTAINER bastian.echterhoelter@arvatosystems.com

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

# Install Java 8 & Maven
RUN export DEBIAN_FRONTEND=noninteractive && \
    sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
    echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee /etc/apt/sources.list.d/webupd8team-java.list && \
    echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886 && \
    apt-get update && \
    echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections && \
    apt-get install oracle-java8-set-default oracle-java8-installer -y && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /var/cache/oracle-jdk8-installer && \
    rm -rf /usr/lib/jvm/java-8-oracle/*src.zip \
               /usr/lib/jvm/java-8-oracle/man \
               /usr/lib/jvm/java-8-oracle/lib/missioncontrol \
               /usr/lib/jvm/java-8-oracle/lib/visualvm \
               /usr/lib/jvm/java-8-oracle/lib/*javafx* \
               /usr/lib/jvm/java-8-oracle/jre/lib/plugin.jar \
               /usr/lib/jvm/java-8-oracle/jre/lib/ext/jfxrt.jar \
               /usr/lib/jvm/java-8-oracle/jre/bin/javaws \
               /usr/lib/jvm/java-8-oracle/jre/lib/javaws.jar \
               /usr/lib/jvm/java-8-oracle/jre/lib/desktop \
               /usr/lib/jvm/java-8-oracle/jre/plugin \
               /usr/lib/jvm/java-8-oracle/jre/lib/deploy* \
               /usr/lib/jvm/java-8-oracle/jre/lib/*javafx* \
               /usr/lib/jvm/java-8-oracle/jre/lib/*jfx* \
               /usr/lib/jvm/java-8-oracle/jre/lib/amd64/libdecora_sse.so \
               /usr/lib/jvm/java-8-oracle/jre/lib/amd64/libprism_*.so \
               /usr/lib/jvm/java-8-oracle/jre/lib/amd64/libfxplugins.so \
               /usr/lib/jvm/java-8-oracle/jre/lib/amd64/libglass.so \
               /usr/lib/jvm/java-8-oracle/jre/lib/amd64/libgstreamer-lite.so \
               /usr/lib/jvm/java-8-oracle/jre/lib/amd64/libjavafx*.so \
               /usr/lib/jvm/java-8-oracle/jre/lib/amd64/libjfx*.so

