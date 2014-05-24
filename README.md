# rspec-padrino

rspec-padrino is a gem including helpers for testing a Padrino app using RSpec. Taking much from rspec-rails.

## Install

    gem install rspec-padrino

Depends on padrino-core <~ 0.12.0, sinatra, rack-test, and RSpec 2.

## Usage

Create a Padrino project with option <tt>-t rspec</tt>. Required files will be generated.

Then edit `spec_helper.rb` like:

    RSpec.configure do |conf|
      conf.include Rack::Test::Methods
      conf.include RSpec::Padrino # add this
    end
    
    def app
      ##
      # You should point toplevel #app method to:
      Padrino.application
    end

more usage on RDoc: <http://rubydoc.info/github/udzura/rspec-padrino/frames>

## Related Sites

* [rubygems.org](https://rubygems.org/gems/rspec-padrino)
* [github](https://github.com/udzura/rspec-padrino)
* [![Build Status](https://travis-ci.org/udzura/rspec-padrino.svg?branch=master)](https://travis-ci.org/udzura/rspec-padrino)

## Contributing to rspec-padrino
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
* Fork the project
* Start a feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## LICENSE

See LICENSE.txt for further details.

