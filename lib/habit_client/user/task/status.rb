class HabitClient::User::Task

  module Status

    def completed?
      task['completed'] == true
    end

  end

end
