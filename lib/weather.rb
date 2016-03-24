require 'unitwise'


require 'weather/conditions'
require 'weather/condition'
require 'weather/configuration'
require 'weather/version'


# The Weather module is responsible for fetching, parsing, and curating weather
# data.

module Weather
  
  def self.configuration
    @configuration ||= Configuration.new
  end
  
  def self.configure
    yield configuration
  end
  
end
