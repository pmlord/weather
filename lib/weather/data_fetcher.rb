require 'faraday'

require 'weather/data_fetcher/connection'


module Weather


  # Weather::DataFetcher is a base class with abstracted functionality intended to
  # be inherited by classes that are responsible for connecting to external
  # weather APIs.
  #
  # Example:
  #
  #     class Weather::DataSource::Noaa::NdbcFetcher < Weather::DataFetcher
  #       # ...
  #     end
  
  class DataFetcher
    
    include Connection

    def self.get(*args)
      self.new(*args).get
    end
    
    def get(path, params=nil)
      connection.get(path) do |request|
        request.params = params if params
      end
    end

  end
end
