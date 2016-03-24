# require 'net/http'
require 'faraday'
require 'uri'


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

  end
end
