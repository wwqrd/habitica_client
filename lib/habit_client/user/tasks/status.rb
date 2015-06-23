class HabitClient::User::Tasks

  module Status

    def completed(&block)
      tasks = self.select { |task| task.completed? }
    end

    def uncompleted(&block)
      tasks = self.select { |task| !task.completed? }
    end

  end

end
