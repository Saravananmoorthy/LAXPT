#/bin/bash

echo "this is a demo of a working puppet master"

# get help
vagrant ssh puppet.vm.local -c 'puppet describe user'
