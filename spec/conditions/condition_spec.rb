require 'spec_helper'

describe Weather::Condition do

  let(:time) { Time.now }
  let(:condition) { Weather::Condition.new(:wind_speed, Unitwise(5, 'knot'), time) }

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
  # describe '#source' do
  #   subject {condition.name}
  #   it { is_expected.to eq() }
  # end


end
