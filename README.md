habit_client [![Build Status](https://travis-ci.org/steeeve/habit_client.svg?branch=master)](https://travis-ci.org/steeeve/habit_client) [![Code Climate](https://codeclimate.com/github/steeeve/habit_client/badges/gpa.svg)](https://codeclimate.com/github/steeeve/habit_client)
============

A HabitRPG client gem.

Presently read-only, plan to add write functionality in future.

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

### Stats
```ruby
stats = habit_client.user.stats

puts stats.training
puts stats.buffs
puts stats.per
puts stats.int
puts stats.con
puts stats.str
puts stats.points
puts stats.lvl
puts stats.gp
puts stats.exp
puts stats.mp
puts stats.hp
puts stats.to_next_level
puts stats.max_health
puts stats.max_mp
puts stats.player_class
```

### Task
```ruby
stats = habit_client.user.tasks

tasks.each do |task|
    puts task.daily?
    puts task.todo?
    puts task.habit?
    puts task..id
    puts task.text
    puts task.notes
    puts task.value
    puts task.priority
    puts task.attribute
    puts task.tags
end

tasks.habits.each do |habit|
    ...
end

tasks.dailies.each do |habit|
    ...
end

tasks.todos.each do |completed|
    puts todo.completed?
    puts task.checklist
    puts task.date_created
    puts todo.date_completed
end
```
