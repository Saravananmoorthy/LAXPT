# require 'spec_helper'

# describe service 'puppetmaster' do
#   it { should be_enbled }
#   it { should be_running }
# end
#
# describe port(8140) do
#   it { should be_listening }
# end
#
# describe command 'service puppetmaster status' do
#   its(:stdout) { should contain(/\* master is running/) }
# end
#
# describe command 'puppet --version' do
#   its(:stdout) { should contain(/3.4.3/) }
# end
#
# describe package('puppetmaster'), :if => os[:family] == 'ubuntu' do
#   it { should be_installed.with_version('9') }
# end
#
# describe command 'puppet status info' do
#   its(:stdout) { should contain /Run mode 'user': local/}
# end
#
# describe command 'puppet cert list --all' do
#   its(:stdout) { should contain /pm00.vm.local/}
# end
#
# be_reachable
# In order to test a given host is network reachable, you should use be_reachable matcher.
#
# describe host('pa00.vm.local') do
#   it { should be_reachable } # ping
#   it { should be_reachable.with( :port => 22 ) }
#   it { should be_reachable.with( :port => 22, :proto => 'tcp' ) }
#   it { should be_reachable.with( :port => 8140, :proto => 'udp' ) }
#   it { should be_reachable.with( :port => 22, :proto => 'tcp', :timeout => 1 ) }
# end
#
#
# puts "\n\n\ntemplatedir=$confdir/templates << test line not there!!\n\n"
#
# describe file('/etc/puppet/puppet.conf') do
#   it { should be_file }
#   it { should exist }
#   its(:content) { should match /fake words/ }
#
#   # actually, this should be in the [main] section
#   its(:content) { should match /dns_alt_names = puppet,puppet.vm.local/}
# end
