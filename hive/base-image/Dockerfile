FROM ubuntu:24.04

RUN apt update &&\
    apt install -y wget
RUN useradd -ms /bin/bash admin
RUN mkdir /workspace && chown admin:admin /workspace

WORKDIR /workspace
USER admin

RUN wget https://jdk.java.net/java-se-ri/17-MR1/https://download.java.net/openjdk/jdk17.0.0.1/ri/openjdk-17.0.0.1+2_linux-x64_bin.tar.gz &&\
    tar -xzvf openjdk-17.0.0.1+2_linux-x64_bin.tar.gz &&\
    mv openjdk-17.0.0.1+2_linux-x64_bin java &&\
    rm openjdk-17.0.0.1+2_linux-x64_bin.tar.gz

ENV JAVA_HOME=/workspace/java
ENV PATH=$PATH:$JAVA_HOME/bin

