# -*- mode: ruby -*-
# vi: set ft=ruby :

# modiified from https://goo.gl/TYcECR

nodes_config = (JSON.parse(File.read("./boot_files/nodes.json")))['nodes']

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|


  config.vm.synced_folder "etc/my_puppet", "/data"

  nodes_config.each do |node|
    node_name   = node[0] # name of node
    node_values = node[1] # content of node

    config.vm.define node_name do |config|

    config.vm.hostname = node_name
    config.vm.network :private_network, ip: node_values[':ip']

    # default RAM for all. no gui
    config.vm.provider "virtualbox" do |vb|
      vb.gui = false
    end

    config.vm.box = node_values[':box']

    # provisioning
    config.vm.provision :shell, :path => node_values[':bootstrap']

    end
  end
end
