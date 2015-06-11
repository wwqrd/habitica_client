class HabitClient::User

  class Stats

    def initialize(user)
      @user = user
    end

    def method_missing(m)
      if respond_to?(m)
        stats[m.to_s]
      else
        super
      end
    end

    def respond_to?(m)
      stats.has_key?(m.to_s)
    end

    def stats
      @stats ||= client.class.get("/user")['stats']
    end

    def client
      @user.client
    end

  end

end
