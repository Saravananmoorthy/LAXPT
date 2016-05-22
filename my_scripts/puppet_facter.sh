#!/bin/bash
vagrant ssh puppet.vm.local -c 'facter kernel'
vagrant ssh puppet.vm.local -c 'facter uptime_seconds'
vagrant ssh puppet.vm.local -c 'facter fdqn'
vagrant ssh puppet.vm.local -c 'facter interfaces'
vagrant ssh puppet.vm.local -c 'facter lsbdistid'
vagrant ssh puppet.vm.local -c 'facter operatingsystem'
vagrant ssh puppet.vm.local -c 'facter uptime'
