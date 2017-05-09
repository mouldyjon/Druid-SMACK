Vagrant.configure(2) do |config|
  config.vm.define :druid do |druid|
    druid.vm.network "private_network", ip: "192.168.50.4"
    druid.vm.box = "ubuntu/trusty64"
    druid.vm.provider :virtualbox do |v|
        v.customize ["modifyvm", :id, "--memory", "8192"]
        v.customize ["modifyvm", :id, "--cpus", "2"] # druid overlord requires multi-core machine
        v.customize ["modifyvm", :id, "--ioapic", "on"]
    end
    druid.vm.synced_folder ".", "/vagrant"
    druid.vm.provision "shell", path: "scripts/setup-ubuntu.sh"
    druid.vm.provision "shell", path: "scripts/setup-java.sh"
    druid.vm.provision "shell", path: "scripts/setup-scala.sh"
    druid.vm.provision "shell", path: "scripts/setup-hadoop.sh"
    druid.vm.provision "shell", path: "scripts/setup-hive.sh"
    druid.vm.provision "shell", path: "scripts/setup-kafka.sh"
    druid.vm.provision "shell", path: "scripts/setup-imply.sh"
    druid.vm.provision "shell", path: "scripts/setup-flink.sh"
    druid.vm.provision "shell", path: "scripts/setup-spark.sh"
    druid.vm.provision "shell", path: "scripts/setup-zepplin.sh"
    druid.vm.provision "shell", path: "scripts/setup-nifi.sh"
    druid.vm.provision "shell", path: "scripts/setup-cassandra.sh"
  end
end
