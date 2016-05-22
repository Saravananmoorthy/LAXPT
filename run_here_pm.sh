#/bin/bash

echo "this is a demo of a working puppet master"

# list all resources
vagrant ssh puppet.vm.local -c 'uname -a; puppet describe --list; '

# short version of description
vagrant ssh puppet.vm.local -c 'puppet describe file -s'

# list all available puppet types
vagrant ssh puppet.vm.local -c 'puppet resource --types'
