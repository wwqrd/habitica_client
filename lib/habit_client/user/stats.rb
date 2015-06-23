require 'ostruct'
require 'forwardable'

class HabitClient::User

  class Stats

    extend Forwardable

    def_delegators :stats, :training, :buffs, :per, :int, :con, :str,
                   :points, :lvl, :gp, :exp, :mp, :hp, :player_class

    def_delegator :stats, :toNextLevel, :to_next_level
    def_delegator :stats, :maxHealth, :max_health
    def_delegator :stats, :maxMP, :max_mp

    def initialize(user)
      @user = user
    end

    def stats
      @stats ||= OpenStruct.new(
        client.class.get("/user")['stats'].tap do |stats|
          stats['player_class'] = stats['class']
        end
      )
    end

    def client
      @user.client
    end

  end

end
