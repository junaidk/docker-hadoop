#!/bin/bash

sed -i s/hdfs-namenode/$NAMENODE/ $HADOOP_HOME/etc/hadoop/core-site.xml

mkdir -p /data/dfs/data /data/dfs/name /data/dfs/namesecondary 

export FORMAT=namenode

if [ "$SERVICE" == "$FORMAT" ] ; then 
	if [ ! -f /data/dfs/name/current/VERSION ] ; then
  		echo "formatting NameNode"
  		hdfs namenode -format -force > /dev/null 2>&1
	fi
fi
#hdfs namenode -format


hdfs $SERVICE
