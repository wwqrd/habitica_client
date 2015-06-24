require 'httparty'
require 'json'

class HabitClient
  class Client

    include HTTParty

    base_uri 'https://habitrpg.com:443/api/v2/'

    def initialize(user_id, api_token)
      @user_id = user_id
      @api_token = api_token

      self.class.headers('User-Agent' => 'habitapi-rpg',
                         'Content-Type'  => 'application/json',
                         'x-api-key' => @api_token,
                         'x-api-user' => @user_id)
    end

  end
end
