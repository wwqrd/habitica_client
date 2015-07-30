# rubocop:disable all
require_relative '../lib/habitica_client'

require 'byebug'
require 'vcr'
require 'dotenv'
require 'pry'

Dotenv.load

hab = HabiticaClient.new(ENV['TEST_USER_ID'], ENV['TEST_API_TOKEN'])

binding.pry
