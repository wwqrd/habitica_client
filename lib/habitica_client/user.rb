require 'habitica_client/api_base'

class HabiticaClient

  # The authed user.
  class User < HabiticaClient::ApiBase

    require 'habitica_client/user/stats'
    require 'habitica_client/user/tasks'

    # Returns user's stats.
    #
    # @return [HabiticaClient::Stats]
    def stats
      @stats ||= Stats.new(client)
    end

    # Returns user's tasks.
    #
    # @return [HabiticaClient::Tasks]
    def tasks
      @tasks ||= Tasks.new(client)
    end

  end

end
