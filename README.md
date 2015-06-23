habit_client
============

A HabitRPG client gem

#### Status

[![Build Status](https://travis-ci.org/steeeve/habit_client.svg?branch=master)](https://travis-ci.org/steeeve/habit_client)
[![Code Climate](https://codeclimate.com/github/steeeve/habit_client/badges/gpa.svg)](https://codeclimate.com/github/steeeve/habit_client)

Installation
------------

Add this line to your application's Gemfile:

```ruby
gem 'habit_client'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install habit_client

Usage
-----

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
