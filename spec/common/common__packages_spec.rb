require 'spec_helper'

# a fake list of common roles or server properties
# common ports
# common packages...
# common users....

common_packages = ['apg', 'fain2bain', 'ntp', 'netstat', 'puppet']


describe "packages common to all boxes:" do
  common_packages.each do|j|
    describe package(j) do
      it { should be_installed }
    end
  end
end
