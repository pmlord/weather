module Weather::DataSource::Noaa


  # NOAA's National Data Buoy Center
  class NdbcFetcher < Weather::DataFetcher

    attr_reader :buoy_id

    def initialize(buoy_id)
      @buoy_id = case buoy_id
                 when Integer
                   buoy_id
                 when String
                   buoy_id.to_i
                 else
                   raise ArgumentError, 'buoy_id must be an integer or string'
                 end
    end


    def url
      "http://www.ndbc.noaa.gov/data/realtime2/#{@buoy_id}.txt"
    end

    # Send GET to NDBC and return response.
    def get
      @response = super(url)
    end

  end
end