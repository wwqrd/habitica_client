class HabitClient::User

  class Tasks < HabitClient::ApiBase

    require 'habit_client/user/tasks/types'
    require 'habit_client/user/tasks/status'
    require 'habit_client/user/task'

    include Enumerable
    include Types
    include Status

    def each(&block)
      tasks.each do |task|
        block.call Task.parse(client, task)
      end
    end

    def create(attributes = {})
      Task.new(client, attributes).save
    end

    private

    def tasks
      @tasks ||= client.class.get('/user/tasks')
    end

  end

end
