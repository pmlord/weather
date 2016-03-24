module Weather::DataSource::Noaa


  # NOAA's National Data Buoy Center
  class NdbcFetcher < Weather::DataFetcher

    
    def url
      'http://google.com'
    end

    def uri
      # "http://www.ndbc.noaa.gov/data/realtime2/#{buoy_id}.#{data_type}"
      URI.parse 'http://google.com'
    end

    # Send GET to NDBC and return response.
    def get
      @response = Faraday.get(url)
      puts @response.body
      @response
    end



  end
end