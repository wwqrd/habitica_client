class HabitClient

  require 'habit_client/version'
  require 'habit_client/client'
  require 'habit_client/user'

  attr_reader :client

  def initialize(user_id, api_token)
    @client = Client.new(user_id, api_token)
  end

  def user
    @user ||= User.new(self)
  end

end
