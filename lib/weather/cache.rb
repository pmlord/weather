module Weather
  class Cache

    def write(*args)
      cache.write(*args) if cache?
    end

    def read(*args)
      cache.read(*args) if cache?
    end


    private

    def cache
      Weather.configuration.cache_store
    end

    def cache?
      Weather.configuration.cache?
    end

  end
end
