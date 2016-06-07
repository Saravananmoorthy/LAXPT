require 'spec_helper'

package_list = ['ant',
                'solr-tomcat',
                'openjdk-7-jre-headless',
                'tomcat6',
                'openjdk-7-jdk'
              ]

describe "tests for solr servers" do
  package_list.each do |i|
    describe package(i) do
      it { should be_installed}
    end
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
  end

# location of jar files
# dirs exist
end
