class HabitClient::User::Tasks

  module Status

    def completed(&block)
      self.select { |task| task.completed? }
    end

    def uncompleted(&block)
      self.select { |task| !task.completed? }
    end

  end

end
