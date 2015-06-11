class HabitClient::User

  class Tasks

    require "habit_client/user/tasks/types"
    require "habit_client/user/tasks/status"

    include Enumerable
    include Types
    include Status

    def initialize(user)
      @user = user
    end

    def user
      @user
    end

    def each(&block)
      client.class.get("/user/tasks").each do |t|
        block.call Task.new(self, t)
      end
    end

    def client
      user.client
    end
  end

end
