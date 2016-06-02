require 'spec_helper'

describe "tests for puppet.conf" do
  describe file('/etc/puppet/puppet.conf') do
    it { should be_file }
    it { should exist }
    it { should be_mode 644 }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    
    its(:content) { should match /logdir=\/var\/log\/puppet/ }
    its(:content) { should match /vardir=\/var\/lib\/puppet/ }
    its(:content) { should match /ssldir=\/var\/lib\/puppet\/ssl/ }
    its(:content) { should match /rundir=\/var\/run\/puppet/ }
    its(:content) { should match /$factpath=\$vardir\/lib\/facter/ }
    its(:content) { should match /templatedir=\$confdir\/templates/ }
    its(:content) { should match /prerun_command=\/etc\/puppet\/etckeeper-commit-pre/ }
    its(:content) { should match /postrun_command=\/etc\/puppet\/etckeeper-commit-post/ }
    its(:content) { should match /ssl_client_header = SSL_CLIENT_S_DN/ }
    its(:content) { should match /ssl_client_verify_header = SSL_CLIENT_VERIFY/ }
  end
end
