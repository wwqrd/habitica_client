require 'httparty'
require 'json'

class HabiticaClient

  # This wraps up httparty functionality in a habitrpg
  # specific class.
  #
  # Not intented to be accessed directly.
  class Client

    include HTTParty

    base_uri 'https://habitrpg.com:443/api/v3/'

    def initialize(user_id, api_token)
      @user_id = user_id
      @api_token = api_token

      self.class.headers('User-Agent' => 'habitapi-rpg',
                         'Content-Type' => 'application/json',
                         'x-api-key' => @api_token,
                         'x-api-user' => @user_id)
    end

  end

end
