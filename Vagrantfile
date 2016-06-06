# -*- mode: ruby -*-
# # vi: set ft=ruby :
# source; - http://goo.gl/Y18HDe
# nicked code from http://goo.gl/Y18HDe

VAGRANTFILE_API_VERSION = "2"

# Require YAML module
require 'yaml'

# Read YAML file with box details
servers = YAML.load_file('bootfiles/Vagrant.yaml')

# Create boxes
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Iterate through entries in YAML file
  servers.each do |servers|
    config.vm.define servers["name"] do |srv|
      srv.vm.box = servers["box"]
      srv.vm.network "private_network", ip: servers["ip"]
      srv.vm.hostname = servers["hostname"]

      # install puppet with a shell script
      srv.vm.provision "shell", "inline": "echo hello"

      # provision all hosts with official epel repo
      srv.vm.provision "shell", path: "bootfiles/epel.sh"

      # handle hostnames
      config.hostmanager.enabled = true
      config.hostmanager.manage_host = true
      config.hostmanager.manage_guest = true
      config.hostmanager.ignore_private_ip = false
      config.hostmanager.include_offline = true

      srv.vm.provider :virtualbox do |vb|
        vb.name = servers["name"]
        vb.memory = servers["ram"]
      end # end of provider

    end
  end # end of servers.each

end # end of Vagrant
