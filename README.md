Vagrant for Druid "SMACK" (Druid, Hadoop, Zeppelin, Spark, Flink, Cassandra and Kafka) Stack
==================================

#### Introduction

Vagrant project to spin up a single virtual machine running:

* Mesos 1.0 - Not working yet
* Imply 2.1.0 (Druid 0.10.0) 
* Hadoop 2.7.2
* Hive 2.1.1
* Spark 2.1.0
* Kafka 2.12-0.10.2.0 (0.10.2.0)
* Apache Zeppelin 0.7.0
* Apache NiFi 1.1.2
* Apache Flink 1.2.0
* Cassandra 3.10

The virtual machine will be running the following services:

* HDFS NameNode + NameNode
* YARN ResourceManager + JobHistoryServer + ProxyServer
* Hive metastore and server2
* Imply Platform
* Kakfka
* Spark history server
* Zeppelin
* NiFi
* Flink
* Cassandra
* Zeppelin

#### Web user interfaces

Here are some useful links to navigate to various UI's:

* Mesos Master:  (http://192.168.50.4:5050)
* YARN resource manager:  (http://192.168.50.4:8088)
* Job history:  (http://192.168.50.4:19888/jobhistory/)
* HDFS: (http://192.168.50.4:50070/dfshealth.html)
* Druid Console: (192.168.50.4:8081/#/datasources)
* Druid Indexer Coordinator Console: (192.168.50.4:8090/console.html)
* Spark history server: (http://192.168.50.4:18080)
* Spark context UI (if a Spark context is running): (http://192.168.50.4:4040)
* Zeppelin UI: (http://192.168.50.4:8889)
* NiFi UI: (http://192.168.50.4:8080/nifi)
* Flink UI: (192.168.50.4:8085/#/overview)
