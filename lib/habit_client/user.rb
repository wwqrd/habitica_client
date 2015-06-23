class HabitClient
  class User

    require 'habit_client/user/stats'
    require 'habit_client/user/tasks'
    require 'habit_client/user/task'

    def initialize(habitrpg)
      @habitrpg = habitrpg
    end

    def stats
      @stats ||= Stats.new(self)
    end

    def tasks
      @tasks ||= Tasks.new(self)
    end

    def client
      @habitrpg.client
    end

  end
end
