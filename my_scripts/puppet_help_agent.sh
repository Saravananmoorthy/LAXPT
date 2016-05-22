#!/bin/bash
vagrant ssh puppet.vm.local -c 'puppet help agent'

vagrant ssh puppet.vm.local -c 'puppet help report'
