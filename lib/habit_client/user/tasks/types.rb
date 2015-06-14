class HabitClient::User::Tasks

  module Types

    def habits(&block)
      by_type('habit', &block)
    end

    def dailys(&block)
      by_type('daily', &block)
    end

    def todos(&block)
      by_type('todo', &block)
    end

    def by_type(type, &block)
      self.select { |task| task.type?(type) }
    end

  end

end
