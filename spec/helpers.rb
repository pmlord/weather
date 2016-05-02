require 'webmock/rspec'
require 'uri'

module Helpers

  def stub_preloaded_url(url)
    WebMock.stub_request(:get, url).
      to_return(body: File.new("#{ROOT_PATH}/fixtures/http_stubs/#{url}.txt"))
  end

  def stub_timeout(url)
    WebMock.stub_request(:get, url).
      to_timeout
  end

end
