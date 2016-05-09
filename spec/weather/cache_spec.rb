require 'spec_helper'

describe Weather::Cache do

  context 'when cache is implemented' do
    before(:all) do
      Weather.reset_configuration!
      Weather.configuration.set_cache_store(:file_store, 'tmp/cache')
      @key = SecureRandom.hex
      @timestamp = Time.now
    end

    it '#write' do
      expect( Weather.cache.write(@key, @timestamp, expire: 5.minutes) )
        .to be true
    end

    it '#read' do
      expect( Weather.cache.read(@key) )
        .to eq @timestamp
    end
  end

  context 'when cache is not implemented' do
    before(:all) do
      Weather.reset_configuration!
      @key = SecureRandom.hex
      @timestamp = Time.now
    end

    it '#write' do
      expect( Weather.cache.write(@key, @timestamp, expire: 5.minutes) )
        .to be_nil
    end

    it '#read' do
      expect( Weather.cache.read(@key) )
        .to be_nil
    end
  end

end
