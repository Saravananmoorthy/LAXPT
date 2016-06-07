require 'spec_helper'

describe service('puppetmaster') do
  it {should be_running }
  it {should be_enabled }
  # monitored by....
end

describe command('dpkg -l puppetmaster') do, if os[:family] == 'debian' | 'ubuntu'
  its(:stdout) { should match /3.4.3/ }
end

describe command('puppet master --version') do
  its(:stdout) { should match /3.4.3/ }
end

describe command('rpm -qa| grep puppetmaster') do, if os[:family] == 'redhat'
  its(:stdout) { should match /3.4.3/ }
end

describe command('puppet master --version') do, if os[:family] == 'redhat'
  its(:stdout) { should match /3.4.3/ }
end
