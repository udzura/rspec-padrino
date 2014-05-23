module RSpec::Padrino
  module Matchers
    require 'rspec/padrino/matchers/routing_matchers'
    require 'rspec/padrino/matchers/redirect_to'

    def self.included(base)
      base.send :include, RSpec::Padrino::Matchers::RoutingMatchers
      base.send :include, RSpec::Padrino::Matchers::RedirectTo
    end
  end
end
