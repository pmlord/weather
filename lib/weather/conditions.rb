module Weather

  class Conditions < Hash

    attr_accessor :time

    def add_condition(name, *args)
      self.merge! name => Condition.new(name, *args)
    end

    def conditions
      values
    end
  end

end
