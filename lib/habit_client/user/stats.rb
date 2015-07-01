require 'ostruct'
require 'forwardable'

class HabitClient::User

  require 'habit_client/api_base'

  class Stats < HabitClient::ApiBase

    extend Forwardable

    def_delegators :stats, :training, :buffs, :per, :int, :con, :str,
                   :points, :lvl, :gp, :exp, :mp, :hp, :player_class

    def_delegator :stats, :toNextLevel, :to_next_level
    def_delegator :stats, :maxHealth, :max_health
    def_delegator :stats, :maxMP, :max_mp

    def stats
      @stats ||= OpenStruct.new(Stats.parse(client.class.get('/user')['stats']))
    end

    def self.parse(stats)
      stats.tap do |s|
        s['player_class'] = s['class']
      end
    end

  end

end
