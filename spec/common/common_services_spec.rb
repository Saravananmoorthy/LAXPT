require 'spec_helper'

describe "common services for all boxes" do
  describe service('ntp') do
    it { should be_enabled }
    it { should be_running }
    # monitored by ..
  end
end
