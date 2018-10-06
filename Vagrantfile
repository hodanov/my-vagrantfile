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
    software-properties-common

    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
    apt-get install -y docker-ce
    systemctl enable docker

    curl -L "https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    chmod +x /usr/local/bin/docker-compose

    echo 'PS1_COLOR_BEGIN="\\[\\e[1;31m\\]"\nPS1_COLOR_END="\\[\\e[m\\]\"\nPS1_HOST_NAME="MyUbuntu"\nexport PS1="${PS1_COLOR_BEGIN}[\\u@\\\${PS1_HOST_NAME} \\W]\${PS1_COLOR_END}\\\\\$ "' >> ~/.bash_profile
    cp ~/.bash_profile /home/vagrant/.bash_profile
  SHELL
end
