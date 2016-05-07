require 'spec_helper'

describe Weather::Configuration do

  context 'when initialized with defaults' do
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

  context 'wen setting cache_store' do
    let(:config) { Weather.configuration }

    shared_examples 'cache_store' do
      it 'writes to cache' do
        cache = config.cache_store
        timestamp = Time.now.to_s
        
        expect(cache.write('test_write', timestamp)).to be true
        expect(cache.read('test_write')).to eq timestamp
      end
    end
      
    context 'to :file_store' do
      describe '#set_cache_store' do
        it do
          expect do
            config.set_cache_store(:file_store)
          end.to raise_error ArgumentError
          expect(config.set_cache_store(:file_store, 'tmp/cache'))
            .to be_kind_of ActiveSupport::Cache::FileStore
        end
      end

      describe '#cache?' do
        it { expect(config.cache?).to be true }
      end

      describe '#cache_store' do
        it { expect(config.cache_store).to be_kind_of ActiveSupport::Cache::FileStore }
      end
    end
    
    it_behaves_like 'cache_store' do
      let(:config) do
        Weather.configuration.set_cache_store(:file_store, 'tmp/cache')
        Weather.configuration
      end
    end
  end

end
