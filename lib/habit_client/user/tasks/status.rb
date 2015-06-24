class HabitClient::User::Tasks

  module Status

    def completed
      select(&:completed?)
    end

    def uncompleted
      select { |task| !task.completed? }
    end

  end

end
