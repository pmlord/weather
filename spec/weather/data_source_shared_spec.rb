require 'spec_helper'

# Shared examples to be included in classes that inherit from
# Weather::DataSource::Base
shared_examples 'DataSource descendants' do

  subject { described_class }
  
  before(:each) do
    stub_preloaded_url('www.ndbc.noaa.gov/data/realtime2/44007.txt')
    # stub_timeout('www.ndbc.noaa.gov/data/realtime2/44007.txt')
  end

  describe '#get_conditions' do
    subject { described_class.get_conditions }
    it { is_expected.to be_instance_of Conditions }
  end
  
end
