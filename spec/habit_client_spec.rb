require 'spec_helper'

describe 'HabiticaClient' do

  let(:habitrpg) { HabiticaClient.new(USER_ID, API_TOKEN) }

  it 'can be initialized' do

    expect(habitrpg).to be_a(HabiticaClient)

  end

  describe '#user' do

    it 'returns a user' do
      expect(habitrpg.user).to be_a(HabiticaClient::User)
    end

  end

end
