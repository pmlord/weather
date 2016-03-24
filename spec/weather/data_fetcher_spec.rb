require 'spec_helper'

shared_examples 'data fetcher' do

  subject { described_class }
  it { is_expected.to be < Weather::DataFetcher }
  it { is_expected.to respond_to :get }

end
