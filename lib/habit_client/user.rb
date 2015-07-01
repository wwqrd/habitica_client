class HabitClient

  require 'habit_client/api_base'

  class User < HabitClient::ApiBase

    require 'habit_client/user/stats'
    require 'habit_client/user/tasks'
    require 'habit_client/user/task'

    def stats
      @stats ||= Stats.new(client)
    end

    def tasks
      @tasks ||= Tasks.new(client)
    end

  end
end
