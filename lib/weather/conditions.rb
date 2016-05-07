require 'ostruct'

module Weather

  class Conditions < OpenStruct

    attr_accessor :time

    def add_condition(name, *args)
      send("#{name}=", Condition.new(name, *args))
    end

    def conditions
      values
    end
  end

end
