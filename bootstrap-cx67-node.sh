#!/bin/sh
# source: https://goo.gl/MDNxR8
# Run on VM to bootstrap Puppet Master server

sudo yum clean all

# selinux


# sudo iptables -F
#
# if ps aux | grep "puppet master" | grep -v grep 2> /dev/null; then
#     echo "Puppet Master is already installed. Exiting..."
# else
#   sudo yum install epel-release
#   sudo yum install -y puppet-server  puppet
#   sudo puppet resource package puppet-server ensure=latest
#
#   #Configure /etc/hosts file
#   echo "" | sudo tee --append /etc/hosts 2> /dev/null && \
#   echo "# Host config for Puppet Master and Agent Nodes" | sudo tee --append /etc/hosts 2> /dev/null && \
#   echo "192.168.40.5      puppet01.vm.local  puppet"   | sudo tee --append /etc/hosts 2> /dev/null && \
#   echo "192.168.40.6      xmon.vm.local  xmon"   | sudo tee --append /etc/hosts 2> /dev/null && \
#   echo "192.168.40.10     checkmk01.vm.local checkmk01"  | sudo tee --append /etc/hosts 2> /dev/null && \
#   echo "192.168.40.15     checkmk02.vm.local checkmk02"  | sudo tee --append /etc/hosts 2> /dev/null && \
#   echo "192.168.40.20     solr01.vm.local solr01"  | sudo tee --append /etc/hosts 2> /dev/null && \
#   echo "192.168.40.25     solr02.vm.local checkmk"  | sudo tee --append /etc/hosts 2> /dev/null && \
#   echo "192.168.40.50     opsview.vm.local checkmk"  | sudo tee --append /etc/hosts 2> /dev/null
#   #
#   # Add optional alternate DNS names to /etc/puppet/puppet.conf
#   sudo sed -i 's/.*\[main\].*/&\ndns_alt_names = puppet,puppet.vm.local/' /etc/puppet/puppet.conf
#
#   ln -s /vagrant/site.pp /etc/puppet/manifests/site.pp
#
#   puppet master
#
# fi


#

#
#     # symlink manifests from Vagrant synced folder location

#
#     ##
#     ##
#     ##       iliminate!!
#     ##
#     ##
#     ## fix the incorrect permissions on this file
#     ## touch  /etc/puppet/modules/check_mk/metadata.json
#     ## chmod 0644 /etc/puppet/modules/check_mk/metadata.json
