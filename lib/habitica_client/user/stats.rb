require 'ostruct'
require 'forwardable'
require 'hashup'

class HabiticaClient::User

  module StatsProperty
    def stats
      @stats ||= Stats.new(data['stats'])
    end
  end

  class Stats
    extend Forwardable
    extend Hashup

    attr_reader :stats

    def_delegators :stats, :training, :buffs, :per, :int, :con, :str,
                   :points, :lvl, :gp, :exp, :mp, :hp, :player_class

    def_delegator :stats, :toNextLevel, :to_next_level
    def_delegator :stats, :maxHealth, :max_health
    def_delegator :stats, :maxMP, :max_mp

    hashup :training, :buffs, :per, :int, :con, :str, :points, :lvl,
           :gp, :exp, :mp, :hp, :player_class, :to_next_level,
           :max_health, :max_mp

    def initialize(api_data)
      api_data['player_class'] = api_data['class'] # 'class' is reserved
      @stats = OpenStruct.new(api_data)
    end

  end

end
