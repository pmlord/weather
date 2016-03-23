module Weather
  
  class Conditions
    def conditions
      @conditions ||= Hash.new
    end
  end
  
end
