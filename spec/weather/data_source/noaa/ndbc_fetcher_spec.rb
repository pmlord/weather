require 'spec_helper'

describe Weather::DataSource::Noaa::NdbcFetcher do

  include_examples 'data fetcher'
  
  describe 'instance' do
    let(:fetcher) { Weather::DataSource::Noaa::NdbcFetcher.new }

    before do
      stub_request(:get, "www.ndbc.noaa.gov/data/realtime2/44007.txt").
        to_return(body: File.new("#{ROOT_PATH}/fixtures/http_stubs/www.ndbc.noaa.gov/data/realtime2/44007.txt.txt"))
    end
    
    it { expect(fetcher.get).to be_a Faraday::Response }
  end

end
