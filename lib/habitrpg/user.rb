class HabitRPG
  class User

    def initialize(client)
      @client = client
    end

    def stats
      @client.get("/user")
    end

  end
end
