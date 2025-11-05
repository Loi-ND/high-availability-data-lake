FROM loind31/hdfs-base-img:v0

USER root
RUN apt update && \
    apt install -y python3 python3-pip && \
    apt install jupyter-notebook -y &&\
    pip3 install pyspark --break-system-packages &&\
    pip3 install findspark --break-system-packages
USER admin

RUN wget https://dlcdn.apache.org/spark/spark-3.5.7/spark-3.5.7-bin-hadoop3.tgz &&\
    tar -xvf spark-3.5.7-bin-hadoop3.tgz &&\
    mv spark-3.5.7-bin-hadoop3 spark &&\
    rm spark-3.5.7-bin-hadoop3.tgz

ENV SPARK_HOME=/workspace/spark
ENV PATH=$PATH:$SPARK_HOME/bin:$SPARK_HOME/sbin
ENV LD_LIBRARY_PATH=$HADOOP_HOME/lib/native:$LD_LIBRARY_PATH
ENV HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop

RUN mv $SPARK_HOME/conf/spark-defaults.conf.template $SPARK_HOME/conf/spark-defaults.conf
RUN mkdir -p /workspace/spark-events