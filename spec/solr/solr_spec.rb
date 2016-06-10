require 'spec_helper'

package_list = ['ant',
                'nc',
                'openjdk-7-jdk',
                'openjdk-7-jre-headless',
                'ruby-devel',
                'ruby-rdoc',
                'rubygems',
                'solr-tomcat',
                'tomcat6'
              ]

dirs = ['/opt/consul', '/opt/consul/ui']

users = ['jenkins', 'docker', 'changeme']

describe "tests for solr servers" do
  package_list.each do |i|
    describe package(i) do
      it { should be_installed}
    end
  end

  describe command(yum grouplist) do
    its(:stdout) { should match /Development Tools/}
  end

  describe service('tomcat6') do
    it { should be_running }
    it { should be_enabled }
  end

  describe port(8080) do
    it { should be_listening }
  end

  describe file('/etc/tomcat6') do
    it { should be_directory }
    it { should exist }
  end

  describe file('/etc/tomcat6/comcat-users.xml') do
    it { should exist }
    it { should be_file }
    its(:content) { should match \/role rolename="admin"/}
    its(:content) { should match \/user username="tomcat" password="tomcat" roles="manager,admin"/}
    its(:content) { should match /__changeme__/ }
  end

  users.each do |j|
    describe user(j) do
      it { should exist }
      it { should have_lgin_shell '/bin/bash' }
    end
  end

# location of jar files
# dirs exist
end
