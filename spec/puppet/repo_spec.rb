require 'spec_helper'

describe "tests for puppet-specific repos" do
  describe yumrepo('epel') do
  	it { should be_enabled }
  end

	describe yumrepo('puppetlabs-pc1') do
		it { shold be_enabled}
	end
end
