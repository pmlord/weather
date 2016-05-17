module Weather

  class Error < StandardError
  end

  class MethodNotImplemented < Error
  end
  
  class MissingApiCredentials < Error
  end

end
