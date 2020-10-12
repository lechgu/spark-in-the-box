## Spark in the box

This is a turnkey solution to create a local Spark cluster for experimenting with pyspark.

#### Requirements

Docker with docker-compose installed.

#### usage

`docker-compose build docker-compose up -d`
The build stage might take a few minutes, depending on your Internet connection.
Once the containers are started:

- access jupyter on port 8888
- access spark Ux on port 8080

#### notes

the cluster has a master node, a worker node and a driver node. Number of worker nodes can be adjusted by editing docker-compose.yml
