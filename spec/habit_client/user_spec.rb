require 'spec_helper'

describe 'User', :vcr do

  let(:habitrpg) { HabitClient.new(USER_ID, API_TOKEN) }
  let(:user) { habitrpg.user }

  it 'is a user object' do
    expect(user).to be_a(HabitClient::User)
  end

  describe '#stats' do

    subject { user.stats }

    it 'returns Stats' do
      expect(subject).to be_a(HabitClient::User::Stats)
    end

  end

  describe '#tasks' do

    subject { user.tasks }

    it 'returns Tasks' do
      expect(subject).to be_a(HabitClient::User::Tasks)
    end

  end

end
