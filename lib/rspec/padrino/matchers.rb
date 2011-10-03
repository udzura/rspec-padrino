module RSpec::Padrino
  module Matchers
    require 'rspec/padrino/matchers/routing_matchers'
    def self.included(base)
      base.send :include, RSpec::Padrino::Matchers::RoutingMatchers
    end
  end
end

