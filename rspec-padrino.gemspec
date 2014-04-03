# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rspec/padrino/version'

Gem::Specification.new do |spec|
  spec.name          = "rspec-padrino"
  spec.version       = RSpec::Padrino::VERSION
  spec.authors       = ["Uchio KONDO"]
  spec.email         = ["udzura@udzura.jp"]
  spec.description   = "rspec-padrino is a gem including helpers for testing a Padrino app using RSpec. Taking much from rspec-rails."
  spec.summary       = "rspec-padrino is a gem including helpers for testing a Padrino app using RSpec. Taking much from rspec-rails."
  spec.homepage      = "http://github.com/udzura/rspec-padrino"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "sinatra", ">= 0"
  spec.add_runtime_dependency "padrino-core", "~> 0.12.0"
  spec.add_runtime_dependency "rspec", ">= 2.0"
  spec.add_runtime_dependency "rack-test", ">= 0"

  spec.add_development_dependency "padrino-helpers", "~> 0.12.0"
  spec.add_development_dependency "rdoc", ">= 0"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "simplecov", ">= 0"
  spec.add_development_dependency "pry", ">= 0"

  spec.add_development_dependency "rake"
end
