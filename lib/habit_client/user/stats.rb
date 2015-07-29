require 'ostruct'
require 'forwardable'
require 'hashup'

class HabitClient::User

  class Stats < HabitClient::ApiBase

    extend Forwardable
    extend Hashup

    def_delegators :stats, :training, :buffs, :per, :int, :con, :str,
                   :points, :lvl, :gp, :exp, :mp, :hp, :player_class

    def_delegator :stats, :toNextLevel, :to_next_level
    def_delegator :stats, :maxHealth, :max_health
    def_delegator :stats, :maxMP, :max_mp

    hashup :training, :buffs, :per, :int, :con, :str, :points, :lvl,
           :gp, :exp, :mp, :hp, :player_class, :to_next_level,
           :max_health, :max_mp

    def self.parse(stats)
      stats.tap do |s|
        s['player_class'] = s['class']
      end
    end

    private

    def stats
      @stats ||= OpenStruct.new(Stats.parse(client.class.get('/user')['stats']))
    end

  end

end
