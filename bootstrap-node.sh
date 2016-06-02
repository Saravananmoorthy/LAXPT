#!/bin/sh
# https://goo.gl/odwkFV
# Run on VM to bootstrap Puppet Agent nodes

sudo apt-get -yq autoremove
sudo iptables -F

if ps aux | grep "puppet agent" | grep -v grep 2> /dev/null
then
    echo "Puppet Agent is already installed. Moving on..."
else
  # install puppet agent only
    sudo apt-get install -yq puppet bash-completion
fi

if cat /etc/crontab | grep puppet 2> /dev/null
then
    echo "Puppet Agent is already configured. Exiting..."
else
    sudo apt-get update -yq && sudo apt-get upgrade -yq

    sudo puppet resource cron puppet-agent ensure=present \
      user=root minute=30 \
      command='/usr/bin/puppet agent --onetime --no-daemonize --splay'

    sudo puppet resource service puppet ensure=running enable=true

    # Configure /etc/hosts file
    echo "" | sudo tee --append /etc/hosts 2> /dev/null && \
    echo "# Host config for Puppet Master and Agent Nodes" | sudo tee --append /etc/hosts 2> /dev/null && \
    echo "192.168.40.5      puppet01.vm.local  puppet"   | sudo tee --append /etc/hosts 2> /dev/null && \
    echo "192.168.40.6      xmon.vm.local  xmon"   | sudo tee --append /etc/hosts 2> /dev/null && \
    echo "192.168.40.10     checkmk.vm.local checkmk"  | sudo tee --append /etc/hosts 2> /dev/null && \
    echo "192.168.40.15     checkmk02.vm.local checkmk02"  | sudo tee --append /etc/hosts 2> /dev/null && \
    echo "192.168.40.20     solr01.vm.local solr01"  | sudo tee --append /etc/hosts 2> /dev/null && \
    echo "192.168.40.25     solr02.vm.local solr02"  | sudo tee --append /etc/hosts 2> /dev/null && \
    echo "192.168.40.50     opsview.vm.local opsview"  | sudo tee --append /etc/hosts 2> /dev/null

    # Add agent section to /etc/puppet/puppet.conf
    echo "" && echo "[agent]\nserver=puppet" | sudo tee --append /etc/puppet/puppet.conf 2> /dev/null

    sudo puppet agent --enable
fi
