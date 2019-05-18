# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"
  config.vm.network "private_network", ip: "192.168.33.15"
  config.vm.synced_folder "./", "/vagrant", :mount_options => ["dmode=777,fmode=777"]
  config.vm.provision "shell", inline: <<-SHELL
    apt-get update
    apt-get remove docker docker-engine docker.io
    apt-get install -y git \
    silversearcher-ag \
    vim \
    tree \
    jq \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
    apt-get install -y docker-ce
    systemctl enable docker

    curl -L "https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    chmod +x /usr/local/bin/docker-compose
    usermod -a -G docker vagrant

    cp /vagrant/.bash_profile ~/
    cp /vagrant/.bash_profile /home/vagrant/
  SHELL
end
