class HabitClient::User

  class Task

    require "habit_client/user/task/status"
    require "habit_client/user/task/type"

    include Status
    include Type

    def initialize(tasks, task)
      @tasks = tasks
      @task = task
    end

    def id
      task['id']
    end

    def text
      task['text']
    end

    def notes
      task['notes']
    end

    def client
      @tasks.client
    end

    private

      def task
        @task
      end

  end

end
