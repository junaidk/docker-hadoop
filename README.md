# docker-hadoop
Dockerfile for running Hadoop on Ubuntu

## hadoop cmd container for file listing and put/get
```bash
docker run -it  -e "NAMENODE=172.31.0.58"  --network=host  hadoopcmd hadoop fs -ls /
```
