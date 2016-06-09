#!/bin/bash
#
# this node should already have the epel repo

yum install -y puppet
cp -v /vagrant/etc/puppet/puppet_agent.conf /etc/puppet/puppet.conf
