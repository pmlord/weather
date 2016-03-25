require 'faraday'


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
    
    def self.get(*args)
      self.new(*args).get
    end
    
    def get(path, params=nil)
      connection.get(path) do |request|
        request.params = params if params
      end
    end
    
    def connection
      @connection ||= Faraday.new
    end
    
  end
end
