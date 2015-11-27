# -*- mode: ruby -*-
# vi: set ft=ruby :
# Author: andrei@skopenko.net

load 'Vagrantfile.local' if File.exist?('Vagrantfile.local')

hostname = "rpmbuilder.dev"

Vagrant.configure("2") do |config|

  config.vm.hostname = hostname

  config.vm.provider "parallels" do |v, override|
    v.name = hostname
    v.memory = 1024
    v.cpus = 1
    override.vm.box = "parallels/centos-6.7"
    override.vm.synced_folder './src', '/opt/rpmbuilder', mount_options: ['share']
  end

  config.vm.provider "virtualbox" do |v, override|
    v.name = hostname
    v.memory = 1024
    v.cpus = 2
    override.vm.box = 'chef/centos-6.7'
    override.vm.synced_folder './src', '/opt/rpmbuilder'
  end

  config.vm.provision :chef_solo do |chef|
    chef.add_recipe('cookbook')
  end

  config.berkshelf.enabled = true
  config.berkshelf.berksfile_path = './cookbook/Berksfile'
end

# Requirements
Vagrant.require_version(">= 1.7.0")

required_plugins = ['vagrant-berkshelf']
missed_plugins = required_plugins.select { |p| !Vagrant.has_plugin?(p) }
if !missed_plugins.empty?
  ui = Vagrant::UI::Colored.new()
  ui.error "---- ERROR ----"
  ui.error "This Vagrant environment requires following Vagrant plugins:"
  ui.error "  #{missed_plugins.join("\n  ")}"
  ui.error ""
  ui.error "Execute to install them:"
  ui.error "  vagrant plugin install #{missed_plugins.join(" ")}"
  exit 1
end
