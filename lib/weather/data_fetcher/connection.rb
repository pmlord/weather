
class Weather::DataFetcher


  module Connection

    def connection
      @connection ||= begin
        Faraday.new(api_base_url)
      end
    end

  end

end
