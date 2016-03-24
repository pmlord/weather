require 'spec_helper'

shared_examples 'data source' do

  subject { described_class }
  it { is_expected.to respond_to :get }

  describe '#get_conditions' do
    subject { described_class.get }
    it { is_expected.to be_instance_of Conditions }
  end
  
end
