require 'spec_helper'

describe Weather::Conditions do
    
  let(:conditions) { Weather::Conditions.new }
  
  describe '#add_condition' do
    it do
      conditions.add_condition(:wind_speed, Unitwise(5, 'knot'), Time.now, Weather::DataSource::Noaa::Ndbc)
      expect(conditions.wind_speed).to be_kind_of Weather::Condition
      expect(conditions.wind_speed.value.simplified_value).to eq 5
    end
  end
    
end
