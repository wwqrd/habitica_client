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
      tasks = self.select { |task| task.type?(type) }
      tasks.each do |task|
        block.call task
      end
    end

  end

end
