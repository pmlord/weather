require 'spec_helper'

describe Weather::Configuration do

  context 'when setting cache_store' do

    before(:all) { Weather.reset_configuration! }
    let(:config) { Weather.configuration }

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

      describe 'cache.write' do
        it 'writes to cache' do
          cache = config.cache_store
          timestamp = Time.now.to_s

          expect(cache.write('test_write', timestamp)).to be true
          expect(cache.read('test_write')).to eq timestamp
        end
      end

    end

  end
end
