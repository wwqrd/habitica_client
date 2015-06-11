# Habitrpg::Api

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'habitrpg-api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install habitrpg-api

## Usage

### Planned Usage:

```ruby
habitrpg.user.stats  # User stats
habitrpg.user.habits  # Return habits
habitrpg.user.dailies  # Return dailies
habitrpg.user.tasks  # Return task
habitrpg.user.tasks(id).checklist(id).completed!  # Complete checklist item
habitrpg.user.tasks(id).completed!  # Complete task
habitrpg.user.habits(id).failed!  # Fail habit
habitrpg.user.habits(id).completed!  # Complete habit
habitrpg.user.dailies(id).completed!  # Complete daily
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/habitrpg-api/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
