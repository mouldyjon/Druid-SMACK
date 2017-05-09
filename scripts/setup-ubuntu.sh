#!/bin/bash
# https://docs.vagrantup.com/v2/provisioning/shell.html

source "/vagrant/scripts/common.sh"

function disableFirewall {
	echo "disabling firewall"
	service iptables save
	service iptables stop
	chkconfig iptables off
}

function setupHosts {
	echo "modifying /etc/hosts file"
	echo "127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4" >> /etc/nhosts
	echo "::1         localhost localhost.localdomain localhost6 localhost6.localdomain6" >> /etc/nhosts

	cp /etc/nhosts /etc/hosts
	rm -f /etc/nhosts
}

function installextra {
    DEBIAN_FRONTEND=noninteractive apt-get install \
      linux-image-extra-$(uname -r) \
      linux-image-extra-virtual
}

function installSSHPass {
	DEBIAN_FRONTEND=noninteractive apt-get install -y sshpass nss
}

function overwriteSSHCopyId {
	cp -f $RES_SSH_COPYID_MODIFIED /usr/bin/ssh-copy-id
}

function createSSHKey {
	echo "generating ssh key"
	ssh-keygen -t rsa -P "" -f ~/.ssh/id_rsa
	cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
	cp -f $RES_SSH_CONFIG ~/.ssh
}

function setupUtilities {
    # so the `locate` command works
    DEBIAN_FRONTEND=noninteractive apt-get install -y supervisor vim less net-tools inetutils-ping curl git telnet nmap socat dnsutils netcat software-properties-common maven mlocate npm tar tree wget
    updatedb
}

function installNodejs {
# Using Ubuntu
curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -
DEBIAN_FRONTEND=noninteractive apt-get install -y nodejs
}

function installDocker {
	apt-get install -y docker.io
    ln -sf /usr/bin/docker.io /usr/local/bin/docker
    sed -i '$acomplete -F _docker docker' /etc/bash_completion.d/docker.io
}

function WebUpd8 {
	add-apt-repository -y ppa:webupd8team/java
}

echo "updating package index"
apt-get update

echo "setup ubuntu"
disableFirewall

echo "setup ubuntu hosts file"
setupHosts

echo "setup extra packages"
installextra

echo "setup ssh"
installSSHPass
createSSHKey
overwriteSSHCopyId

echo "setup utilities"
setupUtilities
installNodejs

#echo "setup docker"
#installDocker

echo "Adding WebUpd8 repository"
WebUpd8

echo "updating package index"
apt-get update

echo "ubuntu setup complete"
