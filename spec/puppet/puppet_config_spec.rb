require 'spec_helper'

describe "tests for puppet.conf" do
  describe command('puppet config print') do
    its(:stdout) { should match /autoflush = true/}
    its(:stdout) { should match /bindaddress = 0.0.0.0/}
    its(:stdout) { should match /ca_port = 8140/}
    its(:stdout) { should match /certdir = \/home\/vagrant\/.puppet\/ssl\/certs/}
    its(:stdout) { should match /certname = ubuntu-1404.vagrantup.com/}
    its(:stdout) { should match /config = \/home\/vagrant\/.puppet\/puppet.conf/}
    its(:stdout) { should match /configprint = all/}
    its(:stdout) { should match /configtimeout = 120/}
    its(:stdout) { should match /factpath = \/home\/vagrant\/.puppet\/var\/lib\/facter:\/home\/vagrant\/.puppet\/var\/facts/}
    its(:stdout) { should match /fileserverconfig = \/home\/vagrant\/.puppet\/fileserver.conf/}
    its(:stdout) { should match /hiera_config = \/home\/vagrant\/.puppet\/hiera.yaml/}
    its(:stdout) { should match /http_proxy_port = 3128/}
    its(:stdout) { should match /keylength = 4096/}
    its(:stdout) { should match /libdir = \/home\/vagrant\/.puppet\/var\/lib/}
    its(:stdout) { should match /logdir = \/home\/vagrant\/.puppet\/var\/log/}
    its(:stdout) { should match /manifestdir = \/home\/vagrant\/.puppet\/manifests/}
    its(:stdout) { should match /module_repository = https:\/\/forge.puppetlabs.com/}
    its(:stdout) { should match /modulepath = \/home\/vagrant\/.puppet\/modules:\/usr\/share\/puppet\/modules/}
    its(:stdout) { should match /noop = false/}
    its(:stdout) { should match /onetime = false/}
    its(:stdout) { should match /ordering = title-hash/}
    its(:stdout) { should match /publickeydir = \/home\/vagrant\/.puppet\/ssl\/public_keys/}
    its(:stdout) { should match /puppetport = 8139/}
    its(:stdout) { should match /report_server = puppet/}
    its(:stdout) { should match /runinterval = 1800/}
    its(:stdout) { should match /signeddir = \/home\/vagrant\/.puppet\/ssl\/ca\/signed/}
    its(:stdout) { should match /smtpserver = none/}
    its(:stdout) { should match /splaylimit = 1800/}
    its(:stdout) { should match /ssl_client_verify_header = HTTP_X_CLIENT_VERIFY/}
    its(:stdout) { should match /ssldir = \/home\/vagrant\/.puppet\/ssl/}
    its(:stdout) { should match /storeconfigs = false/}
    its(:stdout) { should match /storeconfigs_backend = active_record/}
    its(:stdout) { should match /strict_hostname_checking = false/}
    its(:stdout) { should match /stringify_facts = true/}
    its(:stdout) { should match /syslogfacility = daemon/}
    its(:stdout) { should match /tagmap = \/home\/vagrant\/.puppet\/tagmail.conf/}
    its(:stdout) { should match /templatedir = \/home\/vagrant\/.puppet\/var\/templates/}
    its(:stdout) { should match /trusted_node_data = false/}
    its(:stdout) { should match /usecacheonfailure = true/}
    its(:stdout) { should match /user = puppet/}
    its(:stdout) { should match /vardir = \/home\/vagrant\/.puppet\/var/}
    its(:stdout) { should match /waitforcert = 120/}
    its(:stdout) { should match /yamldir = \/home\/vagrant\/.puppet\/var\/yaml/}
    its(:stdout) { should match /zlib = true/}
  end
end
