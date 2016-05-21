require 'spec_helper'

describe package('ntp') do
  it { should be_installed }
end


describe package('nmap') do
  it { should be_installed }
end

describe package('tcpdump') do
  it { should be_installed }
end
