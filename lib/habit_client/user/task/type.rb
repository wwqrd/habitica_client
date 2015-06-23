class HabitClient::User::Task

  module Type

    def habit?
      type?('habit')
    end

    def daily?
      type?('daily')
    end

    def todo?
      type?('todo')
    end

    def type?(type)
      task.type == type
    end

  end

end
