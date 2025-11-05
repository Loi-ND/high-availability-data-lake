FROM ubuntu:24.04

RUN apt update &&\
    apt install -y wget &&\
    apt install -y curl
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

RUN wget https://archive.apache.org/dist/hive/hive-4.0.1/apache-hive-4.0.1-bin.tar.gz &&\
    tar -xzvf apache-hive-4.0.1-bin.tar.gz &&\
    mv apache-hive-4.0.1-bin hive &&\
    rm apache-hive-4.0.1-bin.tar.gz

ENV HIVE_HOME=/workspace/hive
ENV PATH=$PATH:$HIVE_HOME/bin

RUN curl -L https://repo1.maven.org/maven2/org/postgresql/postgresql/42.2.24/postgresql-42.2.24.jar -o ${HIVE_HOME}/lib/postgresql-42.2.24.jar

RUN wget https://dlcdn.apache.org/hadoop/common/hadoop-3.3.5/hadoop-3.3.5.tar.gz  &&\
    tar -xzvf hadoop-3.3.5.tar.gz &&\
    mv hadoop-3.3.5 hadoop &&\
    rm hadoop-3.3.5.tar.gz

RUN mkdir -p /workspace/hadoop/data/dfs/name && \
    mkdir -p /workspace/hadoop/data/dfs/data && \
    mkdir -p /workspace/hadoop/logs

ENV HADOOP_HOME=/workspace/hadoop
ENV PATH=$PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin
ENV CLASSPATH=$CLASSPATH:/workspace/hadoop/lib/*:.
ENV CLASSPATH=$CLASSPATH:/workspace/hive/lib/*:.
