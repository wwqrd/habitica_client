class HabitClient

  # The basis of all HabitClient endpoint objects.
  #
  # All HabitClient endpoint objects need a reference to the http
  # client so that we can make the API work using the dot syntax.
  class ApiBase

    attr_reader :client

    def initialize(client)
      @client = client
    end

  end

end
