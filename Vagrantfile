# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

#  config.vm.boot_timeout = 20
# config.ssh.insert_key = false

  config.vm.box_check_update = false
  config.vm.box_download_insecure = false
  config.vm.box = "ux1404"

  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.memory = "512"
  end

  config.vm.define :puppet, primary: true do |puppet|
    puppet.vm.hostname = "puppet.vm.local"
    puppet.vm.box = "cx71"
    puppet.vm.network "private_network", ip: "192.168.40.5"

    puppet.vm.provision "shell", path: "vagrant_data/pm_install.sh"
  end

  config.vm.define :pa00, autostart: false do |pa00|
    pa00.vm.hostname = "pa00.vm.local"
    pa00.vm.network "private_network", ip: "192.168.40.15"
  end

  config.vm.define :pa01, autostart: false do |pa01|
    pa01.vm.hostname = "pa01.vm.local"
    pa01.vm.network "private_network", ip: "192.168.40.20"
  end

end
