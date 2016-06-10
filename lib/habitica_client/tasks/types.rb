class HabiticaClient::Tasks

  module Types

    def habits
      by_type('habit')
    end

    def dailies
      by_type('daily')
    end

    def todos
      by_type('todo')
    end

    def by_type(type)
      select { |task| task.type == type }
    end

  end

end
