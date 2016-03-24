module Weather::DataSource::Noaa


  # NOAA's National Data Buoy Center
  class NdbcFetcher < Weather::DataFetcher

    
    
    def api_base_url
      # "http://www.ndbc.noaa.gov/data/realtime2/#{buoy_id}.#{data_type}"
      'http://www.ndbc.noaa.gov/data/realtime2'
    end
    
    def path
      '44007.txt'
    end

    # Send GET to NDBC and return response.
    def get
      @response = super(path)
    end



  end
end