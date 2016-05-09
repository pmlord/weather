require 'spec_helper'

describe Weather do

  describe '#configuration' do
    it { expect(Weather.configuration).to be_a(Weather::Configuration) }
  end

  describe '#configure' do
    Weather.configure do |config|
      config.condition_names << :some_new_custom_condition_name
    end
    it { expect(Weather.configuration.condition_names).to include(:some_new_custom_condition_name) }
  end

  describe '#cache' do
    subject { Weather.cache }
    it { is_expected.to be_kind_of Weather::Cache }
  end

end
