class HabiticaClient::Task

  module Type

    def habit?
      type == 'habit'
    end

    def daily?
      type == 'daily'
    end

    def todo?
      type == 'todo'
    end

  end

end
