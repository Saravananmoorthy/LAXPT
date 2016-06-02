require 'spec_helper'

puppet_dirs = ['/etc/puppet',
            '/etc/puppet/files',
            '/etc/puppet/manifests',
            '/etc/puppet/templates',
            '/etc/puppet/modules']

puppet_dirs.each do |i|
  describe file(i) do
    it { should be_directory }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    it { should be_mode 755 }
  end
end
