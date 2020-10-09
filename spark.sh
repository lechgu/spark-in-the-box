#! /bin/bash
if [ "$1" -eq 0 ]; then
    spark-class org.apache.spark.deploy.master.Master --ip 0.0.0.0 --port 7077 --webui-port 8080
else
    spark-class org.apache.spark.deploy.worker.Worker --webui-port 8080 spark://master:7077
fi