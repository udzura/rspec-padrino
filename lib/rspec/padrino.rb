module RSpec
  module Padrino
    require 'rspec/padrino/matchers'
    require 'rspec/padrino/methods'

    def self.included(base)
      require 'rspec/padrino/initializers/last_application'
      base.send :include, RSpec::Padrino::Matchers
      base.send :include, RSpec::Padrino::Methods
    end
  end
end
