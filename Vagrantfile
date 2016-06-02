# -*- mode: ruby -*-
# # vi: set ft=ruby :
# source; - http://goo.gl/Y18HDe
# nicked code from http://goo.gl/Y18HDe

Vagrant.require_version ">= 1.6.0"
VAGRANTFILE_API_VERSION = "2"

# Require YAML module
require 'yaml'

# Read YAML file with box details
servers = YAML.load_file('bootfiles/servers.yaml')

# Create boxes
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Iterate through entries in YAML file
  servers.each do |servers|
    config.vm.define servers["name"] do |srv|
      srv.vm.box = servers["box"]
      srv.vm.network "private_network", ip: servers["ip"]

      # install puppet with a shell script
      srv.vm.provision "shell", path: "bootfiles/install_puppet_agent.sh"

      # now you can provision with puppet
      srv.vm.provision "puppet" do |puppet|
        puppet.manifest_file  = "manifests/site.pp"
        puppet.manifests_path = "."
      end

      srv.vm.provider :virtualbox do |vb|
        vb.name = servers["name"]
        vb.memory = servers["ram"]
      end # end of provider

    end
  end # end of servers.each
end # end of Vagrant
