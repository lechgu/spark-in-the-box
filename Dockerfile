FROM openjdk:8-jdk-slim-buster

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y python3.7 python3-pip python3-venv wget vim && \
    apt-get autoremove && \
    python3 -m venv /venv

COPY dist/* ./

RUN tar -xzf hadoop-2.7.7.tar.gz && \
    mv hadoop-2.7.7 /hadoop && \
    rm hadoop-2.7.7.tar.gz && \
    tar -xzf spark-3.0.1-bin-without-hadoop.tgz && \
    mv spark-3.0.1-bin-without-hadoop /spark && \
    rm spark-3.0.1-bin-without-hadoop.tgz

COPY core-site.xml hadoop-env.sh /hadoop/etc/hadoop/

COPY requirements.txt spark.sh jupyter.sh ./
RUN /venv/bin/pip install -r requirements.txt && \
    chmod +x /jupyter.sh /spark.sh

ENV HADOOP_HOME="/hadoop"
ENV SPARK_HOME="/spark"
ENV PATH="/venv/bin:${HADOOP_HOME}/bin:${SPARK_HOME}/bin:${PATH}"

WORKDIR /app