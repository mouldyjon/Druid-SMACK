#!/bin/bash

source "/vagrant/scripts/common.sh"

function installLocalImply {
	echo "install Imply from local file"
	FILE=/vagrant/resources/$IMPLY_ARCHIVE
	tar -xzf $FILE -C /usr/local
}

function installRemoteImply {
	echo "install Imply from remote file"
	curl -sS -o /vagrant/resources/$IMPLY_ARCHIVE -O -L $IMPLY_MIRROR_DOWNLOAD
	tar -xzf /vagrant/resources/$IMPLY_ARCHIVE -C /usr/local
}

function installImply {
	if resourceExists $IMPLY_ARCHIVE; then
		installLocalImply
		else
			installRemoteImply
			fi
	ln -s /usr/local/$IMPLY_VERSION $IMPLY_PREFIX
	#mkdir -p $IMPLY_PREFIX/logs
}
function startServices {
	echo "starting Imply service"
    $IMPLY_PREFIX/bin/supervise -c $IMPLY_CONF_DIR/supervise/quickstart.conf &
    #/usr/local/imply/bin/supervise -c /usr/local/imply/conf/supervise/quickstart.conf &
    
}
echo "setup Imply"
installImply
startServices
echo "Imply setup complete"