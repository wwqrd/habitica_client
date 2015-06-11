class HabitClient::User::Tasks

  module Status

    def completed(&block)
      tasks = self.select { |task| task.completed? }
      tasks.each do |task|
        yield task
      end
    end

    def uncompleted(&block)
      tasks = self.select { |task| !task.completed? }
      tasks.each do |task|
        yield task
      end
    end

  end

end
