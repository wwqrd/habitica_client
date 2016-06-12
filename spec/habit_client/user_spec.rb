require 'spec_helper'

describe 'User', :vcr do

  let(:habitrpg) { HabiticaClient.new(USER_ID, API_TOKEN) }
  let(:user) { habitrpg.user }

  it 'is a user object' do
    expect(user).to be_a(HabiticaClient::User)
  end

end
