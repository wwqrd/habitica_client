require_relative '../lib/habitica_client'

require 'awesome_print'
require 'byebug'
require 'vcr'
require 'dotenv'

Dotenv.load

USER_ID = ENV['TEST_USER_ID']
API_TOKEN = ENV['TEST_API_TOKEN']

VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock
  c.default_cassette_options = { record: :new_episodes }
  c.configure_rspec_metadata!
end

# RSpec.configure do |c|
# end
