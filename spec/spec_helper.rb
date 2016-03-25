require 'weather'

require 'helpers'
RSpec.configure do |config|
  config.include Helpers
end

require 'webmock/rspec'
WebMock.disable_net_connect!

ROOT_PATH = File.dirname(__FILE__)
