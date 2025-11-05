FROM ubuntu:24.04

RUN apt update &&\
    apt install -y wget
RUN useradd -ms /bin/bash admin
RUN mkdir /workspace && chown admin:admin /workspace

WORKDIR /workspace
USER admin

RUN wget https://download.java.net/java/GA/jdk24.0.2/fdc5d0102fe0414db21410ad5834341f/12/GPL/openjdk-24.0.2_linux-x64_bin.tar.gz &&\
    tar -xzvf openjdk-24.0.2_linux-x64_bin.tar.gz &&\
    mv jdk-24.0.2 java &&\
    rm openjdk-24.0.2_linux-x64_bin.tar.gz

ENV JAVA_HOME=/workspace/java
ENV PATH=$PATH:$JAVA_HOME/bin

RUN wget https://github.com/trinodb/trino/releases/download/478/trino-server-478.tar.gz &&\
    tar -xzvf trino-server-478.tar.gz &&\
    mv trino-server-478 trino &&\
    rm trino-server-478.tar.gz
RUN mkdir /workspace/trino/etc

ENV TRINO_HOME=/workspace/trino
ENV PATH=$PATH:$TRINO_HOME/bin