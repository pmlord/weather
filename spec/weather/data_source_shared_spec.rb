require 'spec_helper'

# Shared examples to be included in classes that inherit from
# Weather::DataSource::Base
shared_examples 'data source' do

  subject { described_class }
  it { is_expected.to respond_to :get }

  describe '#get_conditions' do
    subject { described_class.get }
    it { is_expected.to be_instance_of Conditions }
  end
  
end
