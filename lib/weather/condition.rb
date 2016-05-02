module Weather

  # A basic weather condition, consisting of a :name, :value, :time, and :source.

  class Condition

    attr_reader :name, :value, :time, :source

    def initialize(name, value, time, source)
      @name = name
      @value = value
      @time = time
      @source = source
    end

  end
end
