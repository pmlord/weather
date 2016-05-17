require 'active_support/cache'


module Weather

  class Configuration

    attr_accessor :api_keys, :condition_names, :api_settings

    def initialize
      @api_keys = {}
      @cache_store = nil
      @condition_names = DEFAULT_CONDITION_NAMES
      @api_settings = {}
    end

    DEFAULT_CONDITION_NAMES = %i(wind_direction wind_speed wind_gust wave_height dominent_wave_period average_period mean_wave_direction atmospheric_pressure air_temperature water_temperature dew_point visibility pressure_tendency tide )


    def cache?
      !@cache_store.nil?
    end

    def cache_store
      @cache_store
    end

    def set_cache_store(store, *args)
      @cache_store = ActiveSupport::Cache.lookup_store(store, *args)
    end

  end
end
