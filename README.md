# docker-hadoop
Dockerfile for running Hadoop on Ubuntu

## hadoop cmd container for file listing and put/get
docker run -it  -e "NAMENODE=172.31.0.58"  --network=host  mi096684/hadoopcmd hadoop fs -ls /
