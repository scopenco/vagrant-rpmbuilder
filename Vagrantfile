# -*- mode: ruby -*-
# vi: set ft=ruby :
# Author: andrei@skopenko.net

load 'Vagrantfile.local' if File.exist?('Vagrantfile.local')

hostname = "rpmbuild.dev"

$script = <<SCRIPT
yum -y install epel-release
yum -y groupinstall 'Development Tools'
yum -y install mock git vim-enhanced bash-completion rpmdevtools
usermod -G mock vagrant
SCRIPT

Vagrant.configure("2") do |config|

  config.vm.hostname = hostname
  config.vm.box = "bento/centos-7.2"
  config.vm.provision "shell", inline: $script

  config.vm.provider "parallels" do |v, override|
    v.name = hostname
    v.memory = 1024
    v.cpus = 2
    v.linked_clone = true
    override.vm.synced_folder './src', '/opt/rpmbuilder', mount_options: ['share']
  end

  config.vm.provider "virtualbox" do |v, override|
    v.name = hostname
    v.memory = 1024
    v.cpus = 2
    v.linked_clone = true
    override.vm.synced_folder '~', '/opt/Home'
    override.vm.synced_folder './src', '/opt/rpmbuilder'
  end

  config.vm.provider "fusion" do |v, override|
    v.name = hostname
    v.memory = 1024
    v.cpus = 2
    v.linked_clone = true
    override.vm.synced_folder '~', '/opt/Home'
    override.vm.synced_folder './src', '/opt/rpmbuilder'
  end
end
