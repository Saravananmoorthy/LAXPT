require 'spec_helper'
# packages common to all roles
# puppet => __agent__


puppet_packages = ['puppetmaster', 'puppet-lint', 'puppet', 'puppetdb']

describe "packages for puppet master:" do
  puppet_packages.each do|j|
    describe package(j) do
      it { should be_installed }
    end
  end
end
