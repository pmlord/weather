require 'weather/data_source/base'

require 'weather/data_source/noaa'


module Weather

  # Data sources are the starting point to using the Weather API. Individual data
  # source classes represent the API of external data sources (like NOAA or
  # Weather Underground). Organizations like NOAA have many different data source
  # classes representing different entities and APIs available.
  #
  # Example:
  #
  #     noaa_buoys = Weather::DataSource::Noaa::Buoy.new
  #     noaa_buoys.get_conditions
  #     # => Weather::Conditions instance
  #
  module DataSource

  end

end

