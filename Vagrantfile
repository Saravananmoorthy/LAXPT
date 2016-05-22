# -*- mode: ruby -*-
# vi: set ft=ruby :

# modiified from https://goo.gl/TYcECR


nodes_config = (JSON.parse(File.read("nodes.json")))['nodes']

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    config.vm.box = "ux1404"

  nodes_config.each do |node|
    node_name   = node[0] # name of node
    node_values = node[1] # content of node

    config.vm.define node_name do |config|

    config.vm.hostname = node_name
    config.vm.network :private_network, ip: node_values[':ip']

    # default RAM for all. no gui
    config.vm.provider "virtualbox" do |vb|
      vb.gui = false
      vb.memory = "512"
    end

    # provisioning
    config.vm.provision :shell, :path => node_values[':bootstrap']

    end
  end
end

## what do we do about  shared folders?

# want /etc/puppet !!!

#
#   # group shared folder
#   config.vm.synced_folder "vagrant_data/", "/data"
#
#     puppet.vm.synced_folder "etc_puppet/", "/etc/puppet"
