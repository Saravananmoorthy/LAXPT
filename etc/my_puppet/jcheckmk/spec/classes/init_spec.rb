require 'spec_helper'
describe 'jcheckmk' do
  context 'with default values for all parameters' do
    it { should contain_class('jcheckmk') }
  end
end
