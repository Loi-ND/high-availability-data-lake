FROM spark-hdfs-base-img:v0
USER root
RUN pip3 install findspark --break-system-packages
USER admin
RUN mkdir -p /workspace/spark-events