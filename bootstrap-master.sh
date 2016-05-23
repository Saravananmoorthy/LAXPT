#!/bin/sh
# source: https://goo.gl/MDNxR8
# Run on VM to bootstrap Puppet Master server

sudo apt-get -yq autoremove

if ps aux | grep "puppet master" | grep -v grep 2> /dev/null
then
    echo "Puppet Master is already installed. Exiting..."
else
    # Install Puppet Master

    # when using Ubuntu-baked packages
    # apt-get install -yq puppetmaster

    # when using puppetlabs-baked packages
    wget https://apt.puppetlabs.com/puppetlabs-release-trusty.deb && \
    sudo dpkg -i puppetlabs-release-trusty.deb && \
    sudo apt-get update -yq && sudo apt-get upgrade -yq && \
    sudo apt-get install -yq puppetmaster

    # Configure /etc/hosts file
    echo "" | sudo tee --append /etc/hosts 2> /dev/null && \
    echo "# Host config for Puppet Master and Agent Nodes" | sudo tee --append /etc/hosts 2> /dev/null && \
    echo "192.168.40.5    puppet.vm.local  puppet"   | sudo tee --append /etc/hosts 2> /dev/null && \
    echo "192.168.40.10   checkmk.vm.local checkmk"  | sudo tee --append /etc/hosts 2> /dev/null && \
    echo "192.168.40.15   solr01.vm.local checkmk"  | sudo tee --append /etc/hosts 2> /dev/null && \
    echo "192.168.40.20   solr02.vm.local checkmk"  | sudo tee --append /etc/hosts 2> /dev/null && \
    echo "192.168.40.25   javamon.vm.local  node02"   | sudo tee --append /etc/hosts 2> /dev/null

    # Add optional alternate DNS names to /etc/puppet/puppet.conf
    sudo sed -i 's/.*\[main\].*/&\ndns_alt_names = puppet,puppet.vm.local/' /etc/puppet/puppet.conf

    # Install some initial puppet modules on Puppet Master server
#     sudo puppet module install puppetlabs-ntp
#     sudo puppet module install garethr-docker
#     sudo puppet module install puppetlabs-git
#     sudo puppet module install puppetlabs-vcsrepo
#     sudo puppet module install garystafford-fig

    # symlink manifest from Vagrant synced folder location
    ln -s /vagrant/site.pp /etc/puppet/manifests/site.pp

    # fix the incorrect permissions on this file
    #touch  /etc/puppet/modules/check_mk/metadata.json
    # chmod 0644 /etc/puppet/modules/check_mk/metadata.json
fi
