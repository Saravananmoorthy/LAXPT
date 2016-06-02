require 'spec_helper'

describe "tests for installed puppet modules" do
  describe command('puppet module list') do
    its(:stdout) { should match /Firebladee-check_mk/ }
    its(:stdout) { should match /arusso-nagios/ }
    its(:stdout) { should match /ceh-solr/ }
    its(:stdout) { should match /changeme-puppet/ }
    its(:stdout) { should match /example42-jenkins/ }
    its(:stdout) { should match /example42-openntpd/ }
    its(:stdout) { should match /fail-me/ }
    its(:stdout) { should match /fake-module/ }
    its(:stdout) { should match /garethr-docker/ }
    its(:stdout) { should match /jasonc-mongodb/ }
    its(:stdout) { should match /john-module/ }
    its(:stdout) { should match /please-fail/ }
    its(:stdout) { should match /puppetlabs-mysql/ }
    its(:stdout) { should match /test-module/ }
  end
end
