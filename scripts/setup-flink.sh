#!/bin/bash

source "/vagrant/scripts/common.sh"

function installLocalflink {
	echo "install Flink from local file"
	FILE=/vagrant/resources/$FLINK_ARCHIVE
	tar -xzf $FILE -C /usr/local
}

function installRemoteflink {
	echo "install Flink from remote file"
	curl -sS -o /vagrant/resources/$FLINK_ARCHIVE -O -L $FLINK_MIRROR_DOWNLOAD
	tar -xzf /vagrant/resources/$FLINK_ARCHIVE -C /usr/local
}

function installflink {
	if resourceExists $FLINK_ARCHIVE; then
		installLocalflink
		else
			installRemoteflink
			fi
	ln -s /usr/local/$FLINK_VERSION $FLINK_PREFIX
	mkdir -p $FLINK_PREFIX/logs
    cp -f $FLINK_RES_DIR/flink-conf.yaml $FLINK_CONF_DIR/flink-conf.yaml
}
function startServices {
	echo "starting flink service"
	$FLINK_PREFIX/bin/start-local.sh
}
echo "setup flink"
installflink
startServices
echo "flink setup complete"