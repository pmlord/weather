module Weather::DataSource::WorldWeatherOnline


  # World Weather Online's Fetcher
  class DataFetcher < Weather::DataFetcher

    attr_accessor :product, :location, :params

    def initialize(product, location, params={})
      # require api_key & membership_level in Weather.configuration.api_settings
      if settings.blank? || settings[:api_key].blank? || settings[:membership_level].blank?
        raise Weather::MissingApiCredentials
      end

      @product  = product
      @location = location
      @params   = params
    end

    def data_source_symbol
      :world_weather_online
    end

    def url
      "http://api.worldweatheronline.com/#{settings[:membership_level]}/v1/#{@product}.ashx"
    end

    def query_params
      @params.merge({
        q: @location,
        key: settings[:api_key],
        format: 'json'
      })
    end

    # Send GET to NDBC and return response.
    def get
      @response = super(url, query_params)
    end

  end
end
