require 'spec_helper'

describe 'Stats' do

  stats = nil

  VCR.use_cassette :stats do
    habitrpg = HabitClient.new(USER_ID, API_TOKEN)
    stats = habitrpg.user.stats
    # This is bad, we shouldn't know the internal workings of a class
    stats.stats
  end

  let(:object_stats) { [:training, :buffs] }
  let(:numeric_stats) do
    [:per, :int, :con, :str, :points, :lvl, :gp, :exp, :mp, :hp,
     :to_next_level, :max_health, :max_mp]
  end
  let(:text_stats) { [:player_class] }
  let(:fake_stat) { :foobar }

  it 'has object stats' do
    object_stats.each do |stat|
      expect(stats.send(stat)).not_to be_nil
    end
  end

  it 'has numeric stats' do
    numeric_stats.each do |stat|
      expect(stats.send(stat)).not_to be_nil
    end
  end

  it 'has text stats' do
    text_stats.each do |stat|
      expect(stats.send(stat)).not_to be_nil
    end
  end

  it "doesn't have stats" do
    expect { stats.send(fake_stat) }.to raise_error(NoMethodError)
  end

end
