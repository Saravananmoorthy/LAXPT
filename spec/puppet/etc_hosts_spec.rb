require 'spec_helper'

describe file('/etc/hosts') do
  it { should exist }
  it { should be_file }
  its(:content) { should match /puppet.vm.local /}
end
