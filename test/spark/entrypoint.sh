#!/bin/bash
set -e

echo "Formatting namenode (if first run)..."
if [ ! -d "/workspace/hadoop/data/dfs/name/current" ]; then
  $HADOOP_HOME/bin/hdfs namenode -format -force
fi

echo "Starting SSH..."
/usr/sbin/sshd

echo "Starting HDFS..."
$HADOOP_HOME/sbin/start-dfs.sh

echo "Starting YARN..."
$HADOOP_HOME/sbin/start-yarn.sh

echo "Starting Spark history server..."
$SPARK_HOME/sbin/start-history-server.sh

echo "Environment ready."
exec bash
