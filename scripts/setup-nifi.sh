#!/bin/bash

source "/vagrant/scripts/common.sh"

function installLocalNifi {
	echo "install nifi from local file"
	FILE=/vagrant/resources/$NIFI_ARCHIVE
	tar -xzf $FILE -C /usr/local
}

function installRemoteNifi {
	echo "install Nifi from remote file"
	curl -sS -o /vagrant/resources/$NIFI_ARCHIVE -O -L $NIFI_MIRROR_DOWNLOAD
	tar -xzf /vagrant/resources/$NIFI_ARCHIVE -C /usr/local
}

function installNifi {
	if resourceExists $NIFI_ARCHIVE; then
		installLocalNifi
		else
			installRemoteNifi
			fi
	ln -s /usr/local/$NIFI_VERSION $NIFI_PREFIX
	mkdir -p $NIFI_PREFIX/logs
}
function startServices {
	echo "starting nifi service"
	$NIFI_PREFIX/bin/nifi.sh start
}
echo "setup nifi"
installNifi
startServices
echo "nifi setup complete"