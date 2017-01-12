#!/bin/bash

sed -i s/hdfs-namenode/$NAMENODE/ $HADOOP_HOME/etc/hadoop/core-site.xml


#hdfs namenode -format
$@
