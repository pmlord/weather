module Weather

  # A basic weather condition, consisting of a :name, :value, :time, and :source.

  class Condition

    attr_reader :name, :value, :time

    # TODO: #source
    def initialize(name, value, time)
      @name = name
      @value = value
      @time = time
    end

  end
end
