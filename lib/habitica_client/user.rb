require 'habitica_client/api_base'

class HabiticaClient

  # The authed user.
  class User < HabiticaClient::ApiBase

    endpoint '/user/'

    require 'habitica_client/user/stats'

    def stats
      @stats ||= Stats.new(data['stats'])
    end

  end

end
