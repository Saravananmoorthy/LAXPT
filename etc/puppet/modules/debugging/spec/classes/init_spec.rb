require 'spec_helper'
describe 'debugging' do
  context 'with default values for all parameters' do
    it { should contain_class('debugging') }
  end
end
