require 'spec_helper'

describe Weather::Configuration do

  context 'when initialized with defaults' do
    let(:configuration) { Weather.configuration }

    describe '#condition_names' do
      subject { configuration.condition_names }
      it { is_expected.to be_a Array }
      it { is_expected.not_to be_empty }
    end

    describe '#api_keys' do
      subject { configuration.api_keys }
      it { is_expected.to be_a Hash }
      it { is_expected.to be_empty }
    end
    
    describe '#cache?' do
      it { expect(configuration.cache?).to be false }
    end

  end

end
