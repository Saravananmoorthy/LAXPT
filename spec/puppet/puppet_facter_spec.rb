require 'spec_helper'

describe "tests to check puppet facts" do
  describe command('facter --plaintext') do
    its(:stdout) { should match /architecture => x86_64/ }
    its(:stdout) { should match /domain => efinancialcareers.com/ }
    its(:stdout) { should match /kernel => Linux/ }
    its(:stdout) { should match /memorytotal => 7.42 GB/ }
    its(:stdout) { should match /operatingsystem => CentOS/ }
    its(:stdout) { should match /osfamily => RedHat/ }
    its(:stdout) { should match /path => \/usr\/local\/bin:\/usr\/bin/ }
    its(:stdout) { should match /timezone => BST/ }
  end
end
