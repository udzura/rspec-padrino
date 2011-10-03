# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "rspec-padrino"
  gem.homepage = "http://github.com/udzura/rspec-padrino"
  gem.license = "MIT"
  gem.summary = %Q{rspec-padrino is a gem including helpers for testing a Padrino app.}
  gem.description = %Q{rspec-padrino is a gem including helpers for testing a Padrino app using RSpec. Taking much from rspec-rails.}
  gem.email = "udzura@udzura.jp"
  gem.authors = ["Uchio Kondo"]
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
  spec.rspec_opts = "-fs --color"
end

RSpec::Core::RakeTask.new(:"spec:integrations") do |spec|
  spec.pattern = FileList['spec/integrations/**/*_spec.rb']
  spec.rspec_opts = "-fs --color"
end

RSpec::Core::RakeTask.new(:rcov) do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :default => :spec

require 'rdoc/task'
RDoc::Task.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "rspec-padrino #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
