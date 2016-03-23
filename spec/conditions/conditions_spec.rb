require 'spec_helper'

describe Weather::Conditions do
  context 'when initialized' do
    
    let(:conditions) { Weather::Conditions.new }
    
    describe '#conditions' do
      subject {conditions.conditions}
      it { is_expected.to eq({}) }
    end
    
  end
  
end
