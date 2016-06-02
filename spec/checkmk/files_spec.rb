require 'spec_helper'

describe file('/etc/') do
  it { should exit }
end
