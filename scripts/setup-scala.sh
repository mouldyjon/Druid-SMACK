#!/bin/bash
source "/vagrant/scripts/common.sh"

function installLocalScala {
	echo "install scala from local file"
	FILE=/vagrant/resources/$SCALA_ARCHIVE
	tar -xzf $FILE -C /usr/local
}

function installRemoteScala {
	echo "install scala from remote file"
	curl -sS -o /vagrant/resources/$SCALA_ARCHIVE -O -L $SCALA_MIRROR_DOWNLOAD
	tar -xzf /vagrant/resources/$SCALA_ARCHIVE -C /usr/local
}

function installScala {
	echo "installing scala"
	if resourceExists $SCALA_ARCHIVE; then
		installLocalScala
	else
		installRemoteScala
	fi
	ln -s /usr/local/$SCALA_VERSION $SCALA_PREFIX
}

function setupEnvVars {
	echo "creating scala environment variables"
	echo export SCALA_HOME=$SCALA_PREFIX
	echo export PATH=${PATH}:${SCALA_HOME}/bin
}


echo "setup Scala"
installScala
setupEnvVars