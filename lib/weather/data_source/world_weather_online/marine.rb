require 'json'


module Weather::DataSource::WorldWeatherOnline

  class Marine < Weather::DataSource::Base

    attr_accessor :location

    def initialize(location)
      # Location must be a lat/long array or string.
      if location.is_a?(Array)
        @location = location.join(',')
      elsif location.is_a?(String)
        @location = location
      else
        raise ArgumentError, 'Location must be a lat/long array or string'
      end
    end

    def get_conditions
      raw_text_response = data_fetcher.get(:marine, location).body
      data = JSON.parse(raw_text_response)['data']['weather']
      
      
    end


    private

    def data_fetcher
      DataFetcher
    end

  end
end
