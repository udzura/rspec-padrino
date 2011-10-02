module RSpec
  module Padrino
    autoload :Matchers, 'rspec/padrino/matchers'
    autoload :Methods, 'rspec/padrino/methods'
  end

  def self.included(base)
    require 'rspec/padrino/initializers/last_application'
    base.send :include, RSpec::Padrino::Methods
  end
end
