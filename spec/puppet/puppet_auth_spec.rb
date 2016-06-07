describe 'spec_helper'

describe "tests for puppet auth.conf" do
  describe file('/etc/puppet/auth.conf') do
    it { should be_mode 0644 }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    
    its(:content) { should match \/path \/etc\/puppet\/files/}
  end
end
