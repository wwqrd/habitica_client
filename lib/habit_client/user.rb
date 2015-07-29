require 'habit_client/api_base'

class HabitClient

  # The authed user.
  class User < HabitClient::ApiBase

    require 'habit_client/user/stats'
    require 'habit_client/user/tasks'

    # Returns user's stats.
    #
    # @return [HabitClient::Stats]
    def stats
      @stats ||= Stats.new(client)
    end

    # Returns user's tasks.
    #
    # @return [HabitClient::Tasks]
    def tasks
      @tasks ||= Tasks.new(client)
    end

  end

end
