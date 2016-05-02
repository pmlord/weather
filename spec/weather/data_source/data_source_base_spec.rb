require 'spec_helper'


describe Weather::DataSource::Base do

  let(:instance) { Weather::DataSource::Base.new }

  describe '#get___ methods' do
    it 'return Weather::MethodNotImplemented' do
      %i(get_conditions get_forecast).each do |method_name|
        expect { instance.send(method_name) }.to raise_error(Weather::MethodNotImplemented)
      end
    end
  end

end
