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
xmon.vm.local             not created (virtualbox)
checkmk01.vm.local        not created (virtualbox)
checkmk02.vm.local        not created (virtualbox)
solr01.vm.local           not created (virtualbox)
solr02.vm.local           not created (virtualbox)
opsview.vm.local          not created (virtualbox)
jenkins.vm.local          not created (virtualbox)

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

tree
.
├── LICENSE
├── README.md
├── Rakefile
├── Vagrantfile
├── boot_files
│   └── nodes.json
├── bootfiles
│   ├── agent_etc_puppet.conf
│   ├── checkmk_agent_init.pp
│   ├── checkmk_init.pp
│   ├── install_docker.sh
│   ├── nodes.json
│   ├── servers.yaml
│   └── vx_agent_etc_puppet.conf
├── bootstrap-master-ubuntu.sh
├── bootstrap-node.sh
├── etc
│   └── my_puppet
│       ├── checkmk_agent
│       │   ├── Gemfile
│       │   ├── README.md
│       │   ├── Rakefile
│       │   ├── files
│       │   │   ├── check-mk-agent_1.2.4p5-2_all.deb
│       │   │   └── xinetd_check_mk
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
│       ├── modules
│       ├── munin
│       │   ├── README.md
│       │   ├── _Modulefile
│       │   ├── checksums.json
│       │   ├── files
│       │   │   └── plugins-minimal.sh
│       │   ├── manifests
│       │   │   └── node.pp
│       │   ├── metadata.json
│       │   └── templates
│       │       ├── munin-conf-node-info.erb
│       │       └── munin-node.conf.erb
│       └── site.pp
├── properties.yml
├── runRake.sh
├── site.pp
└── spec
    ├── apache
    │   └── solr_spec.rb
    ├── checkmk
    │   ├── files_spec.rb
    │   └── puppet_spec.rb
    ├── common
    │   ├── common__packages_spec.rb
    │   ├── common_services_spec.rb
    │   ├── hosts_spec.rb
    │   └── ntp_agent_spec.rb
    ├── jenkins
    │   └── jenkins_spec.rb
    ├── mysql
    │   └── test_spec.rb
    ├── puppet
    │   ├── fileserver_conf_spec.rb
    │   ├── packages_spec.rb
    │   ├── ports_spec.rb
    │   ├── puppet_auth_spec.rb
    │   ├── puppet_autostart_spec.rb
    │   ├── puppet_conf_spec.rb
    │   ├── puppet_config_spec.rb
    │   ├── puppet_dirs_spec.rb
    │   ├── puppet_modules_spec.rb
    │   ├── puppet_service_spec.rb
    │   └── repo_spec.rb
    ├── solr01
    │   └── solr_spec.rb
    ├── solr02
    │   └── test_spec.rb
    ├── spec_helper.rb
    └── xmon
        └── sample_spec.rb
````
