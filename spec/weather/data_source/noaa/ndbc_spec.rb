require 'spec_helper'
require 'weather/data_source_shared_spec'


describe Weather::DataSource::Noaa::Ndbc do

  let(:ndbc) { Weather::DataSource::Noaa::Ndbc.new }

  before(:each) do
    stub_preloaded_url('www.ndbc.noaa.gov/data/realtime2/44007.txt')
    # stub_timeout('www.ndbc.noaa.gov/data/realtime2/44007.txt')
  end

  describe '#get_conditions' do
    subject { ndbc.get_conditions(44007) }
    it { is_expected.to be_instance_of Weather::Conditions }
  end


  # it_behaves_like 'DataSource decendents'

end
