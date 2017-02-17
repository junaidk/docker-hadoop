#### start NameNode : 
```
docker run -d -h  hdfs-namenode -p 50070:50070  -e "NAMENODE=<host ip>" -e "SERVICE=namenode" --network=host -v <location on host file system>:/data mi096684/hadoop 
```

#### start DataNode : 
```
docker run -d -p 50075:50075  -e "NAMENODE=<name-node ip>" -e "SERVICE=datanode" --network=host -v <location on host file system>:/data  mi096684/hadoop
```

#### start spark master : 
```
docker run -d -h spark-master -p 8080:8080 -p 7077:7077 -e "NAMENODE=<name-node ip>" -e "SERVICE=master" --network=host mi096684/spark
```

#### start spark worker :
```
docker run -d -h spark-worker -p 8080:8080 -p 7077:7077 -e "NAMENODE=<name-node ip>" -e "SERVICE=worker" -e "MASTER=<spark master ip>" --network=host mi096684/spark
```

#### run jar file 
```
docker run -it -v <sprak application jar file location>:/target/ -e "NAMENODE=<name-node ip>"  --network=host mi096684/spark spark-submit --master spark:/<spark master ip>:7077 --class pipeline.kafkaSpark.Kmean /target/KafkaSparkPipeline-0-jar-with-dependencies.jar <kafka broker>:9092 spark://<spark master ip>:7077 hdfs://<name-node ip>:9000/iris.txt hdfs://<name-node ip>:9000/output.txt 
```

#### hadoop cmd container for file listing and put/get
```
docker run -it  -e "NAMENODE=172.31.0.58"  --network=host  mi096684/hadoopcmd hadoop fs -ls /
```
