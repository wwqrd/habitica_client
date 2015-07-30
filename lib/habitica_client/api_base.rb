class HabiticaClient

  # The basis of all HabiticaClient endpoint objects.
  #
  # All HabiticaClient endpoint objects need a reference to the http
  # client so that we can make the API work using the dot syntax.
  class ApiBase

    attr_reader :client

    def initialize(client)
      @client = client
    end

  end

end
