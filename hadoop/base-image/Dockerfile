FROM ubuntu:24.04

RUN apt update &&\
    apt install -y wget
RUN useradd -ms /bin/bash admin
RUN mkdir /workspace && chown admin:admin /workspace

WORKDIR /workspace
USER admin

RUN wget https://download.java.net/openjdk/jdk11.0.0.2/ri/openjdk-11.0.0.2_linux-x64.tar.gz &&\
    tar -xzvf openjdk-11.0.0.2_linux-x64.tar.gz &&\
    mv jdk-11.0.0.2 java &&\
    rm openjdk-11.0.0.2_linux-x64.tar.gz

ENV JAVA_HOME=/workspace/java
ENV PATH=$PATH:$JAVA_HOME/bin

RUN wget https://dlcdn.apache.org/hadoop/common/hadoop-3.3.5/hadoop-3.3.5.tar.gz  &&\
    tar -xzvf hadoop-3.3.5.tar.gz &&\
    mv hadoop-3.3.5 hadoop &&\
    rm hadoop-3.3.5.tar.gz

ENV HADOOP_HOME=/workspace/hadoop
ENV PATH=$PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin

RUN echo 'export JAVA_HOME=/workspace/java' >> $HADOOP_HOME/etc/hadoop/hadoop-env.sh
