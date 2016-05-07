require 'csv'

module Weather::DataSource::Noaa


  # NOAA National Data Buoy Center (NDBC)
  class Ndbc < Weather::DataSource::Base

    def get_conditions(buoy_id, time=Time.now)
      raise ArgumentError unless time.is_a?(Date) || time.is_a?(Time)

      # TODO: Fetch ary_of_conditions from cache if available

      # Get raw text response from NDBC API
      raw_text_response = data_fetcher.get(buoy_id).body

      # Parse raw text response into array of Weather::Conditions
      ary_of_conditions = parse_raw_text_response(raw_text_response)
      
      # TODO: Determine when to expire cache, and handle storage

      # Return Weather::Conditions object based on requested time.
      ary_of_conditions.min_by { |conditions| (conditions.time - time).abs }
    end


    private

    def parse_raw_text_response(raw_text_response)
      # Parse into CSV
      raw_table = CSV.parse(raw_text_response, col_sep: ' ')

      # Separate first two rows into column 'names' and 'units'
      header_rows = raw_table.take(2)
      header_rows.each { |row| row.first.gsub!(/\A#/, '') }
      column_names, column_units = header_rows

      # Separate all other rows into 'data'
      data_rows = raw_table.drop(2)

      # Translate column_names and column_units into appropriate symbols or strings
      # ex. translated_condition_names, translated_condition_units
      translated_condition_names = column_names.map { |name| CONDITION_NAME_MAP[name] }
      translated_condition_units = column_units.map { |unit| UNIT_MAP[unit] || unit }

      # March through data rows and create conditions objects
      data_rows.map do |row|
        conditions = Weather::Conditions.new

        # First five columns are 'YY MM DD hh mm'. Use these to create a Time
        # object, and the rest to create the weather conditions.
        time = Time.utc *row[0..4]
        conditions.time = time
        row[5..-1].each_with_index do |raw_value, i_unadjusted|
          i = i_unadjusted + 5
          name = translated_condition_names[i]
          unit = translated_condition_units[i]
          value = Unitwise(raw_value.to_f, unit)
          conditions.add_condition name, value, time, self.class
        end

        conditions
      end
    end

    def data_fetcher
      NdbcFetcher
    end


    CONDITION_NAME_MAP = {
      'WDIR' => :wind_direction,
      'WSPD' => :wind_speed,
      'GST'  => :wind_gust,
      'WVHT' => :wave_height,
      'DPD'  => :dominent_wave_period,
      'APD'  => :average_period,
      'MWD'  => :mean_wave_direction,
      'PRES' => :atmospheric_pressure,
      'ATMP' => :air_temperature,
      'WTMP' => :water_temperature,
      'DEWP' => :dew_point,
      'VIS'  => :visibility,
      'PTDY' => :pressure_tendency,
      'TIDE' => :tide
    }

    UNIT_MAP = {
      'degT' => 'degree',
      'sec'  => 'second',
      'degC' => 'degree Celsius',
      'nmi'  => 'nautical mile'
    }

  end
end
