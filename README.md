# LAXPT
Code used during the Linux Academy Puppet Training Course

## Objective(s)

* have a working lab ready for the Linux Academy Puppet Training

* use this lap to test anything pupppet-related

[+] checkmk server - any version

[+] puppetmaster

[+] puppet agents - mixed OS

[+] solr - version changme.xyz

[+] collect data and monitor a simple solr service

````bash
vx status                                                                                                                                                                                                                     LAXPT
Current machine states:

puppet01.vm.local         running (virtualbox)
checkmk01.vm.local        running (virtualbox)
checkmk02.vm.local        running (virtualbox)
solr01.vm.local           running (virtualbox)
solr02.vm.local           running (virtualbox)

This environment represents multiple VMs. The VMs are all listed
above with their current state. For more information about a specific
VM, run `vagrant status NAME`.
````



## usage

just tell the user what to do

* edit boot_files/nodes.json file. It's YAML so easy to specify IP addresses, OS, etc


* `vagrant up` or `vagrant up __node.vm.local__`

## sources

I nicked code from these sources

* https://goo.gl/MDNxR8



## this is where you tell the user what all the files and directories are for

### files and stuff

````bash

tree                                                                                                                                                                                                                          LAXPT
.
├── LICENSE
├── README.md
├── Vagrantfile
├── boot_files
│   ├── agent_etc_puppet.conf
│   ├── checkmk_agent_init.pp
│   ├── checkmk_init.pp
│   ├── install_docker.sh
│   ├── nodes.json
│   └── vx_agent_etc_puppet.conf
├── bootstrap-master.sh
├── bootstrap-node.sh
├── etc
│   └── my_puppet
│       ├── checkmk_agent
│       │   ├── Gemfile
│       │   ├── README.md
│       │   ├── Rakefile
│       │   ├── files
│       │   │   ├── check-mk-agent_1.2.4p5-2_all.deb
│       │   │   └── check_mk
│       │   ├── manifests
│       │   │   └── init.pp
│       │   ├── metadata.json
│       │   ├── spec
│       │   │   ├── classes
│       │   │   │   └── init_spec.rb
│       │   │   └── spec_helper.rb
│       │   └── tests
│       │       └── init.pp
│       ├── checkmk_host
│       │   ├── Gemfile
│       │   ├── README.md
│       │   ├── Rakefile
│       │   ├── files
│       │   │   └── check-mk-raw-1.2.8p1_0.trusty_amd64.deb
│       │   ├── manifests
│       │   │   └── init.pp
│       │   ├── metadata.json
│       │   ├── spec
│       │   │   ├── classes
│       │   │   │   └── init_spec.rb
│       │   │   └── spec_helper.rb
│       │   └── tests
│       │       └── init.pp
│       ├── install_docker.sh
│       ├── mod1
│       ├── mod2
│       └── mod3
├── my_scripts
│   ├── puppet_facter.sh
│   ├── puppet_help_agent.sh
│   ├── puppet_notify.sh
│   ├── puppet_user.sh
│   └── run_here_pm.sh
└── site.pp

19 directories, 37 files
````
