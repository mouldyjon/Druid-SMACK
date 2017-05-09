#!/bin/bash

# java
JAVA_ARCHIVE=jdk-8u51-linux-x64.gz

# scala
SCALA_VERSION=scala-2.12.2
SCALA_ARCHIVE=$SCALA_VERSION.tgz
SCALA_MIRROR_DOWNLOAD=https://downloads.lightbend.com/scala/2.12.2/$SCALA_ARCHIVE
SCALA_PREFIX=/usr/local/scala

# hadoop
HADOOP_VERSION=hadoop-2.7.2
HADOOP_ARCHIVE=$HADOOP_VERSION.tar.gz
HADOOP_MIRROR_DOWNLOAD=http://archive.apache.org/dist/hadoop/core/$HADOOP_VERSION/$HADOOP_ARCHIVE
HADOOP_PREFIX=/usr/local/hadoop
HADOOP_CONF=$HADOOP_PREFIX/etc/hadoop
HADOOP_RES_DIR=/vagrant/resources/hadoop

# hive
# JM changed hive version from 1.2.1 to 2.1.1 - 31/03/17
HIVE_VERSION=hive-2.1.1
HIVE_ARCHIVE=apache-$HIVE_VERSION-bin.tar.gz
HIVE_MIRROR_DOWNLOAD=http://archive.apache.org/dist/hive/$HIVE_VERSION/$HIVE_ARCHIVE
HIVE_PREFIX=/usr/local/hive
HIVE_RES_DIR=/vagrant/resources/hive
HIVE_CONF=$HIVE_PREFIX/conf

# Apache Spark
# JM changed spark version from 2.0.0 to 2.1.0 - 31/03/17 
SPARK_VERSION=spark-2.1.0
SPARK_ARCHIVE=$SPARK_VERSION-bin-hadoop2.7.tgz
SPARK_MIRROR_DOWNLOAD=http://d3kbcqa49mib13.cloudfront.net/$SPARK_ARCHIVE
SPARK_PREFIX=/usr/local/spark
SPARK_RES_DIR=/vagrant/resources/spark
SPARK_CONF_DIR=$SPARK_PREFIX/conf

# Zepplin
# JM changed zeppelin version from 0.6.1 to 0.7.0 - 31/07/17
ZEPPELIN_VERSION=zeppelin-0.7.0
ZEPPELIN_ARCHIVE=$ZEPPELIN_VERSION-bin-all.tgz
ZEPPELIN_MIRROR_DOWNLOAD=http://www-us.apache.org/dist/zeppelin/zeppelin-0.7.0/$ZEPPELIN_ARCHIVE
ZEPPELIN_PREFIX=/usr/local/zeppelin
ZEPPELIN_RES_DIR=/vagrant/resources/zeppelin
ZEPPELIN_CONF_DIR=$ZEPPELIN_PREFIX/conf

# nifi
# JM changed nifi version from 1.0.0 to 1.1.2 - 31/07/17
NIFI_VERSION=nifi-1.1.2
NIFI_ARCHIVE=$NIFI_VERSION-bin.tar.gz
NIFI_MIRROR_DOWNLOAD=http://www-us.apache.org/dist/nifi/1.1.2/$NIFI_ARCHIVE
NIFI_PREFIX=/usr/local/nifi
NIFI_RES_DIR=/vagrant/resources/nifi
NIFI_CONF_DIR=$NIFI_PREFIX/conf

# Cassandra
# JM changed cassandra from  3.7 to 3.10 - 31/07/17
CASSANDRA_VERSION=apache-cassandra-3.10
CASSANDRA_ARCHIVE=$CASSANDRA_VERSION-bin.tar.gz
CASSANDRA_MIRROR_DOWNLOAD=http://www-us.apache.org/dist/cassandra/3.10/$CASSANDRA_ARCHIVE
CASSANDRA_PREFIX=/usr/local/cassandra
CASSANDRA_RES_DIR=/vagrant/resources/cassandra
CASSANDRA_CONF_DIR=$CASSANDRA_PREFIX/conf

# Confluent
# JM changed confluent 3.0.1-2.11 to 3.2 - 31/07/17
CONFLUENT_VERSION=confluent-oss-3.2.0-2.11
CONFLUENT_ARCHIVE=$CONFLUENT_VERSION.tar.gz
CONFLUENT_MIRROR_DOWNLOAD=http://packages.confluent.io/archive/3.2/$CONFLUENT_VERSION.tar.gz
CONFLUENT_PREFIX=/usr/local/confluent
CONFLUENT_RES_DIR=/vagrant/resources/confluent
CONFLUENT_CONF_DIR=$CONFLUENT_PREFIX/conf

# Kafka
KAFKA_VERSION=kafka_2.12-0.10.2.0
KAFKA_ARCHIVE=$KAFKA_VERSION.tgz
KAFKA_MIRROR_DOWNLOAD=http://www.us.apache.org/dist/kafka/0.10.2.0/$KAFKA_ARCHIVE
KAFKA_PREFIX=/usr/local/kafka
KAFKA_RES_DIR=/vagrant/resources/kafka
KAFKA_CONF_DIR=$KAFKA_PREFIX/conf

# Imply
IMPLY_VERSION=imply-2.1.0
IMPLY_ARCHIVE=$IMPLY_VERSION.tar.gz
IMPLY_MIRROR_DOWNLOAD=https://static.imply.io/release/$IMPLY_ARCHIVE
IMPLY_PREFIX=/usr/local/imply
IMPLY_RES_DIR=/vagrant/resources/imply
IMPLY_CONF_DIR=$IMPLY_PREFIX/conf

# Flink
FLINK_VERSION=flink-1.2.0
FLINK_ARCHIVE=$FLINK_VERSION-bin-hadoop27-scala_2.11.tgz
FLINK_MIRROR_DOWNLOAD=http://www-us.apache.org/dist/flink/$FLINK_VERSION/$FLINK_ARCHIVE
FLINK_PREFIX=/usr/local/flink
FLINK_RES_DIR=/vagrant/resources/flink
FLINK_CONF_DIR=$FLINK_PREFIX/conf

# Druid
DRUID_VERSION=druid-0.9.2
DRUID_ARCHIVE=$DRUID_VERSION-bin.tar.gz
DRUID_MIRROR_DOWNLOAD=http://static.druid.io/artifacts/releases/$DRUID_ARCHIVE
DRUID_PREFIX=/usr/local/druid
DRUID_RES_DIR=/vagrant/resources/druid
DRUID_CONF_DIR=$DRUID_PREFIX/conf

# ssh
SSH_RES_DIR=/vagrant/resources/ssh
RES_SSH_COPYID_ORIGINAL=$SSH_RES_DIR/ssh-copy-id.original
RES_SSH_COPYID_MODIFIED=$SSH_RES_DIR/ssh-copy-id.modified
RES_SSH_CONFIG=$SSH_RES_DIR/config

function resourceExists {
	FILE=/vagrant/resources/$1
	if [ -e $FILE ]
	then
		return 0
	else
		return 1
	fi
}

function fileExists {
	FILE=$1
	if [ -e $FILE ]
	then
		return 0
	else
		return 1
	fi
}
