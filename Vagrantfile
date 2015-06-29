# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.box = "ubuntu/trusty64"

  config.vm.network "forwarded_port", guest: 5601, host: 5601
  
  config.vm.provider "virtualbox" do |v|
	v.memory = 4096
	v.cpus = 2
  end


  config.vm.provision "shell", path: "provision-script.sh"

 end
