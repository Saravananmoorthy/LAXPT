require 'spec_helper'
fail ('add os test')

describe "tests for puppet auto start", if => os[:osfamily] = 'debian' do
  describe file('/etc/default/puppet') do
    it { should be_file }
    it { shoud exist }
    its(:content) { should match /START=yes/ }
  end
end
