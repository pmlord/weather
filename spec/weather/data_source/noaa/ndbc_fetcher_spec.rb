require 'spec_helper'




describe Weather::DataSource::Noaa::NdbcFetcher do

  # let(:fetcher_class) { Weather::DataSource::Noaa::NdbcFetcher }
  let(:fetcher) { Weather::DataSource::Noaa::NdbcFetcher }
  let(:response) { fetcher.get(44007) }

  before(:each) do
    stub_preloaded_url('www.ndbc.noaa.gov/data/realtime2/44007.txt')
    # stub_timeout('www.ndbc.noaa.gov/data/realtime2/44007.txt')
  end


  include_examples 'data fetcher'

  describe '#new' do
    it 'requires a buoy id as an integer or string' do
      expect{fetcher.new(44007)}.to_not raise_error
      expect{fetcher.new('44007')}.to_not raise_error
      expect{fetcher.new}.to raise_error(ArgumentError)
    end
  end

  describe 'attr_readers' do
    it 'has buoy_id' do
      expect(fetcher.new(44007).buoy_id).to eq 44007
    end
  end

  describe '#get' do
    it 'returns a faraday response object' do
      expect(response).to be_a Faraday::Response
    end
    it 'status should be 200' do
      expect(response.status).to eq 200
    end
  end

end
