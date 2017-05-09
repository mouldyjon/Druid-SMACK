#!/bin/bash

source "/vagrant/scripts/common.sh"

function installLocalCassandra {
	echo "install cassandra from local file"
	FILE=/vagrant/resources/$CASSANDRA_ARCHIVE
	tar -xzf $FILE -C /usr/local
}
function installRemoteCassandra {
	echo "install cassandra from remote file"
	curl -sS -o /vagrant/resources/$CASSANDRA_ARCHIVE -O -L $CASSANDRA_MIRROR_DOWNLOAD
	tar -xzf /vagrant/resources/$CASSANDRA_ARCHIVE -C /usr/local
}
function installCassandra {
	if resourceExists $CASSANDRA_ARCHIVE; then
		installLocalCassandra
		else
			installRemoteCassandra
			fi
	ln -s /usr/local/$CASSANDRA_VERSION $CASSANDRA_PREFIX
	export PATH=$PATH:/usr/local/cassandra/bin
	mkdir -p /usr/local/cassandra/logs
	cp -f $CASSANDRA_RES_DIR/cassandra.yaml $CASSANDRA_CONF_DIR/cassandra.yaml
}

function startServices {
	echo "starting cassandra service"
	$CASSANDRA_PREFIX/bin/cassandra -R &
}

echo "setup cassandra"
installCassandra
#startServices
echo "cassandra install complete"