class HabitClient

  require 'habit_client/version'
  require 'habit_client/client'
  require 'habit_client/user'

  attr_accessor :client

  def initialize(user_id, api_token)
    self.client = Client.new(user_id, api_token)
  end

  def user
    @user ||= User.new(client)
  end

end
