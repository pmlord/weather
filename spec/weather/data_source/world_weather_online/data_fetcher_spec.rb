require 'spec_helper'


describe Weather::DataSource::WorldWeatherOnline::DataFetcher do


  # let(:fetcher_class) { Weather::DataSource::Noaa::NdbcFetcher }
  let(:data_fetcher) { Weather::DataSource::WorldWeatherOnline::DataFetcher }

  context 'when not configured properly' do
    it 'requires api_key' do
      expect { data_fetcher.new('marine', '43.513265,-70.147990') }.to raise_error Weather::MissingApiCredentials
    end
  end

  context 'when configured properly' do
    before(:all) do
      Weather.reset_configuration!
      Weather.configure do |config|
        config.api_settings[:world_weather_online] = {
          api_key: ENV['WORLD_WEATHER_ONLINE_API_KEY'],
          membership_level: :premium
        }
      end
    end

    include_examples 'data fetcher'


    describe '#new' do
      it 'requires product, location, and query params' do
        expect{data_fetcher.new}.to raise_error(ArgumentError)
        expect{data_fetcher.new('marine', '43.513265,-70.147990')}.to_not raise_error
        expect{data_fetcher.new('marine', '43.513265,-70.147990', {tp: 6, fx: 'no'})}.to_not raise_error
      end
    end

    context 'when making http requests' do
      before(:each) do
        stub_preloaded_url('api.worldweatheronline.com/premium/v1/marine.ashx?format=json&key=2ca2c9a6f87f444fb3421225161705&q=43.513265,-70.147990')
        # stub_timeout('')
      end
      
      describe '#get' do
        let(:response) { data_fetcher.get('marine', '43.513265,-70.147990') }
        it 'returns a faraday response object' do
          expect(response).to be_a Faraday::Response
        end
        it 'status should be 200' do
          expect(response.status).to eq 200
        end
      end
    end
  end

end
