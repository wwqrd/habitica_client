require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'

RSpec::Core::RakeTask.new(:spec)
RuboCop::RakeTask.new

task :console do

  ruby 'utils/console.rb'

end

task default: [:rubocop, :spec]
