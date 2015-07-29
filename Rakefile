require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'

RSpec::Core::RakeTask.new(:spec)
RuboCop::RakeTask.new

desc 'Open a PRY console with an instance of `HabitClient` from ENV vars'
task :console do

  ruby 'utils/console.rb'

end

desc 'Run linting and specs'
task test: [:rubocop, :spec]

task default: [:test]
