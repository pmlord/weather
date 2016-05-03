require 'spec_helper'

describe Weather::Condition do

  let(:time) { Time.now }
  let(:condition) { Weather::Condition.new(:wind_speed, Unitwise(5, 'knot'), time, Weather::DataSource::Noaa::Ndbc) }

  describe '#name' do
    subject {condition.name}
    it { is_expected.to eq(:wind_speed) }
  end
  describe '#value' do
    subject {condition.value}
    it { is_expected.to eq(Unitwise(5, 'knot')) }
  end
  describe '#time' do
    subject {condition.time}
    it { is_expected.to eq(time) }
  end
  describe '#source' do
    subject {condition.source}
    it { is_expected.to eq(Weather::DataSource::Noaa::Ndbc) }
  end


end
