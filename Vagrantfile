# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.box = "ubuntu/trusty64"

  config.vm.network "forwarded_port", guest: 5601, host: 5601
  config.vm.network "forwarded_port", guest: 9200, host: 9200
  config.vm.network "forwarded_port", guest: 514, host: 5514
 # config.vm.network "private_network", ip: "192.168.50.22"
  
  config.vm.provider "virtualbox" do |v|
	v.memory = 4096
	v.cpus = 2
  end


  config.vm.provision "shell", path: "provision-script.sh"

 end
