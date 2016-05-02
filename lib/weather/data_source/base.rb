module Weather::DataSource

  # Base class to be inherited by data source classes. Provides common
  # functionality and outlines expected common API methods.
  #
  # Example:
  #
  #     noaa_buoys = Weather::DataSource::Noaa::Buoy.new
  #     noaa_buoys.get_conditions
  #     # => Weather::Conditions instance
  #
  class Base

    # Define standard methods that are expected with any data source. Return
    # Weather::MethodNotImplemented error in case the inheriting class does not
    # override the method. For instance, the NDBC Buoy class,
    # `Weather::DataSource::Noaa::Buoy`, would not implement `#get_forecast`
    # since the service does not provide forecasting.
    %i(get_conditions get_forecast).each do |method_name|
      define_method method_name do
        raise Weather::MethodNotImplemented
      end
    end

  end
end
