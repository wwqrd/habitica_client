HabiticaClient [![Build Status](https://travis-ci.org/steeeve/habitica_client.svg?branch=master)](https://travis-ci.org/steeeve/habitica_client) [![Code Climate](https://codeclimate.com/github/steeeve/habitica_client/badges/gpa.svg)](https://codeclimate.com/github/steeeve/habitica_client)
==============

A Habitica client gem.

Full documentation at [http://www.rubydoc.info/gems/habitica_client/](http://www.rubydoc.info/gems/habitica_client/)

Installation
------------

Add this line to your application's Gemfile:

```ruby
gem 'habitica_client'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install habitica_client

Usage
-----

```ruby
require 'habitica_client'

habit = HabiticaClient.new(ENV['USER_ID'], ENV['API_TOKEN'])

# User stats
habit.user.stats.hp
# 50

# Get tasks
habit.user.tasks.each do |task|
  puts task.text
end

# Create task
task = habit.user.tasks.create(
  text: 'Do the dishes',
  type: 'todo'
)

# Update task (from previous)
task.notes = 'Make sure to clean the drip pan'
task.save
```

### Stats
```ruby
stats = habitica_client.user.stats

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
stats = habitica_client.user.tasks

tasks.each do |task|
    puts task.daily?
    puts task.todo?
    puts task.habit?
    puts task.id
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
