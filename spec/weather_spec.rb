require 'spec_helper'

describe Weather do
  describe "#hi" do
    it %Q{returns "Hello, World!"} do
      expect(Weather.hi).to eq("Hello, World!")
    end
  end
end
