# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'habit_client/version'

Gem::Specification.new do |spec|
  spec.name          = "habit_client"
  spec.version       = HabitClient::VERSION
  spec.authors       = ["Stephen Mckellar"]
  spec.email         = ["stephen@thingmaker.io"]
  spec.summary       =  %q{A HabitRPG client}
  # spec.description  = %q{}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.2"
  spec.add_development_dependency "dotenv", "~> 2.0"
  spec.add_development_dependency "webmock", "~> 1.2"
  spec.add_development_dependency "vcr", "~> 2.9"
  spec.add_development_dependency "pry", "~> 0.10"
  spec.add_development_dependency "rubocop", "~> 0.32"

  spec.add_runtime_dependency "httparty", "~> 0.13"
end
