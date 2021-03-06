# LAXPT
Code used during the Linux Academy Puppet Training Course.

## Objective(s)

* Have a working lab ready for the Linux Academy Puppet Training.

* Use this lab to test anything pupppet-related.

* Use serverspec to test the vagrant boxes (prove my puppet-foo).


## Assumptions

* The puppet server and puppet agent is from the official puppetlabs repo

* EFC is using CentOS7 - use for all nodes

## Tools needed

The state of my workstation at time of writing:-

````bash
vagrant --version
Vagrant 1.8.1

### For automajic handling of hostnames
vagrant plugin install vagrant-hostmanager

ruby --version
ruby 2.0.0p648 (2015-12-16 revision 53162) [universal.x86_64-darwin15]
````



### Ruby gems - install me!!
````bash
gem list | awk '/puppet |bundler|rake/'
bundler (1.11.2)
puppet (4.5.0 universal-darwin, 4.4.2 universal-darwin)
rake (11.1.2, 10.5.0, 0.9.6)
rspec-puppet (2.4.0, 2.0.1)
````


### Vagrant boxes

CentOS 7 but can be anything you like. Just configure in vagrant.yaml.


````bash
vagrant status
Current machine states:

puppet.vm.local
app01.vm.local
app02.vm.local
solr01.vm.local
solr02.vm.local
zoo01.vm.local
zoo02.vm.local
````


## Usage summary

### On host
* $editor vagrant.yaml - define your server "specs". RAM, IP, vagrant box etc

* `vagrant up` to bring up all boxes

* `vagrant hostmanager` # automajic for /etc/hosts

* `vagrant ssh puppet` # log into this box. do your puppet foo

### inside puppetmaster

* `sudo sh /vagrant/bootfiles/centosPM.sh` # install puppetmaster and *screen*

* run `screen`

* start puppet master with `puppet master --no-daemonize`

* All hosts are *autosigned*. No need to sign certs.


### inside puppet agent

* `vagrant ssh [node]` # log into "agent". puppet agent foo here

install puppet agent

* `sudo sh /vagrant/bootfiles/centosPA.sh`

Agent wil be autosigned. So from now run;

* `puppet agent --test`

## Serverspec testing

Bring all of the boxes up. Use `bundle install` to install serverspec. Vagrant boxes are now ready for testing.

Refer to the available list of tests below. These tests are role-based, in the fact that I don't care where my boxes are, but what they __do__. Also refer to the tree below to add new roles for server testing.

### Role-based testing

Put your __roles__ into a new directory, like spec/blah.

````bash
ls -1 spec
apache
checkmk
common
docker
jenkins
mongodb
mysql
puppet
solr
solr02
xmon
````

Add your servers to the roles as shown below.

````bash
head properties.yml                                                                                         ~/projects/LAXPT
# role-based puppet => role-based testing!!
puppet01.vm.local:
  :roles:
    - commonss
    - puppet
xmon.vm.local:
  :roles:
    - common
    - role2
    - docker
````    

Once you have added a new dir under spec and added some tests, they will be listed here.


````bash
rake -T --all
rake serverspec:all        #
rake serverspec:checkmk  # Run serverspec to checkmk.vm.local
rake serverspec:checkmk02  # Run serverspec to checkmk02.vm.local
rake serverspec:jenkins    # Run serverspec to jenkins.vm.local
rake serverspec:opsview    # Run serverspec to opsview.vm.local
rake serverspec:puppet01   # Run serverspec to puppet01.vm.local
rake serverspec:solr01     # Run serverspec to solr01.vm.local
rake serverspec:solr02     # Run serverspec to solr02.vm.local
rake serverspec:xmon       # Run serverspec to xmon.vm.local
rake spec                  # Run serverspec to all hosts
````

## sources

I nicked code from these sources

* https://goo.gl/MDNxR8

* http://goo.gl/Y18HDe



## this is where you tell the user what all the files and directories are for

### files and stuff

All your tests belong in the specs dir. Each dir is a __role__. So give the dirs sensible names.



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
