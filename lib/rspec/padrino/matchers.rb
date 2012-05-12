module RSpec::Padrino
  module Matchers
    require 'rspec/padrino/matchers/routing_matchers'
    def self.included(base)
      base.send :include, RSpec::Padrino::Matchers::RoutingMatchers
      RSpec.configure do |c|
        c.before(:all) {
          RSpec::Padrino::Matchers::RoutingMatchers.hook!
        }
      end
    end
  end
end

