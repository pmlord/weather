require 'spec_helper'

describe Weather::Configuration do

  context 'when initialized with defaults' do

    before(:all) { Weather.reset_configuration! }
    let(:config) { Weather.configuration }

    describe '#condition_names' do
      subject { config.condition_names }
      it { is_expected.to be_a Array }
      it { is_expected.not_to be_empty }
    end

    describe '#api_keys' do
      subject { config.api_keys }
      it { is_expected.to be_a Hash }
      it { is_expected.to be_empty }
    end

    describe '#cache?' do
      it { expect(config.cache?).to be false }
    end

    describe '#cache_store' do
      it { expect(config.cache_store).to be_nil }
    end

  end
end