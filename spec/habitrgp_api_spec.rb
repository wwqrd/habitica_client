require 'spec_helper'

describe 'HabitRPG' do

  USER_ID = ENV['USER_ID']
  API_TOKEN = ENV['API_TOKEN']

  let(:habitrpg) { HabitRPG.new(USER_ID, API_TOKEN) }

  describe 'initialize' do

    it 'can be initialized' do

      expect(habitrpg).to be_a(HabitRPG)

    end

  end

  describe 'user' do

    let(:user) { habitrpg.user }

    it 'is a user object' do
      expect(user).to be_a(HabitRPG::User)
    end

    describe '#stats' do

      it 'returns the user stats' do
        expect(user.stats).to eq({})
      end

    end

  end

end
