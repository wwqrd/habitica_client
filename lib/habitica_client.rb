class HabiticaClient

  require 'habitica_client/version'
  require 'habitica_client/client'
  require 'habitica_client/user'

  attr_accessor :client

  def initialize(user_id, api_token)
    self.client = Client.new(user_id, api_token)
  end

  def user
    @user ||= User.new(client)
  end

end
