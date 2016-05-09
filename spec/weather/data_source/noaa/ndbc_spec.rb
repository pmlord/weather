require 'spec_helper'
require 'weather/data_source_shared_spec'


describe Weather::DataSource::Noaa::Ndbc do

  before(:each) do
    Weather.configuration.set_cache_store(:file_store, 'tmp/cache')
    stub_preloaded_url('www.ndbc.noaa.gov/data/realtime2/44007.txt')
    # stub_timeout('www.ndbc.noaa.gov/data/realtime2/44007.txt')
  end

  context 'when bad arguments are provided on initialization' do
    it 'raises an ArgumentError if the buoy id is bad' do
      expect { Weather::DataSource::Noaa::Ndbc.new(5.2).get_conditions }
        .to raise_error(ArgumentError)
    end

    it 'raises an ArgumentError if the time argument is not a Time/Date object' do
      expect { Weather::DataSource::Noaa::Ndbc.new(44007, 'some time') }
        .to raise_error(ArgumentError)
    end
  end
  
  context do
    let(:ndbc) { Weather::DataSource::Noaa::Ndbc.new(44007) }

    describe '#get_conditions' do
      it 'returns a Weather::Conditions instance' do
        expect(ndbc.get_conditions).to be_instance_of Weather::Conditions
      end
    end

    describe '::get_conditions' do
      it 'returns a Weather::Conditions instance' do
        expect(Weather::DataSource::Noaa::Ndbc.get_conditions(44007))
          .to be_instance_of Weather::Conditions
      end
    end
  end

  # it_behaves_like 'DataSource descendants'

end
