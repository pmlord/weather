require 'spec_helper'

describe Weather::DataSource::Noaa::NdbcFetcher do

  include_examples 'data fetcher'
  
  describe 'instance' do
    let(:fetcher) { Weather::DataSource::Noaa::NdbcFetcher.new }
    
    before do
      stub_request(:get, 'http://google.com').to_return(status: 200, body: 'hi world!')
    end
    
    it { expect(fetcher.get).to be_a Faraday::Response }
  end

end
