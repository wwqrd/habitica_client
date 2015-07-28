require_relative '../lib/habit_client'

require 'byebug'
require 'vcr'
require 'dotenv'
require 'pry'

Dotenv.load

hrpg = HabitClient.new(ENV['TEST_USER_ID'], ENV['TEST_API_TOKEN'])

binding.pry
