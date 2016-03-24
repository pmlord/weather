module Weather

  class Configuration

    attr_accessor :api_keys, :cache, :condition_names

    def initialize
      @api_keys = {}
      @cache = nil
      @condition_names = DEFAULT_CONDITION_NAMES
    end

    DEFAULT_CONDITION_NAMES = %i(wind_direction wind_speed wind_gust wave_height dominent_wave_period average_period mean_wave_direction atmospheric_pressure air_temperature water_temperature dew_point visibility pressure_tendency tide )
    
    
    def cache?
      !@cache.nil?
    end
    
  end
end
