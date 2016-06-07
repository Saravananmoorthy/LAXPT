require 'spec_helper'

describe command('uname -a'), :if => os[:family] == 'redhat' do
  its(:stdout) { should match \/3.10/ }
end
