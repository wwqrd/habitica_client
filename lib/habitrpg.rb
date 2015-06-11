require "habitrpg/version"
require "habitrpg/client"
require "habitrpg/user"

class HabitRPG

  def initialize(user_id, api_token)
    @client = Client.new(user_id, api_token)
  end

  def user
    User.new(@client)
  end

end
