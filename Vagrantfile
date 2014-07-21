# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu_14.04_with_docker"
  config.ssh.username = "ubuntu"

  # config.vm.network "forwarded_port", guest: 80, host: 8888
  config.vm.network "private_network", ip: "192.168.0.4"

  # config.vm.provision "shell", path: "provision.sh", args: "build"

  config.vm.provider "virtualbox" do |v|
    v.memory = 1024
    v.cpus = 2
  end
end
