#!/bin/bash
source "/vagrant/scripts/common.sh"

function installLocalKafka {
	echo "install Kafka from local file"
	FILE=/vagrant/resources/$KAFKA_ARCHIVE
	tar -xzf $FILE -C /usr/local
}
function installRemoteKafka {
	echo "install Kafka from remote file"
	curl -sS -o /vagrant/resources/$KAFKA_ARCHIVE -O -L $KAFKA_MIRROR_DOWNLOAD
	tar -xzf /vagrant/resources/$KAFKA_ARCHIVE -C /usr/local
}
function installKafka {
	if resourceExists $KAFKA_ARCHIVE; then
		installLocalKafka
		else
			installRemoteKafka
			fi
	ln -s /usr/local/kafka_2.12-0.10.2.0 $KAFKA_PREFIX
	mkdir -p $KAFKA_PREFIX/logs
}

function startServices {
	echo "starting Kafka service"
	#/usr/local/kafka/bin/zookeeper-server-start /usr/local/kafka/etc/kafka/zookeeper.properties &
	$KAFKA_PREFIX/bin/kafka-server-start.sh $KAFKA_PREFIX/config/server.properties &
}

echo "setup Kafka"
installKafka
startServices
echo "Kafka install complete"
