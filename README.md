# habit_client

A HabitRPG client gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'habit_client'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install habit_client

## Usage

```ruby
require 'habit_client'

habit = HabitClient.new(ENV['USER_ID'], ENV['API_TOKEN'])

# User stats
habit.user.stats.hp
# 50

# Get tasks
habit.user.tasks.each do |task|
  puts task.text
end
```
