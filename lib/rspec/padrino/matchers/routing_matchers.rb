require 'sinatra/base'
require 'padrino-core'
# defining Proc#source_location
require 'pry' if RUBY_VERSION < '1.9'

module RSpec::Padrino::Matchers
  module RoutingMatchers
    extend RSpec::Matchers::DSL

    matcher :route_to do |*expected|
      expected_routes = nil
      last_name = nil
      last_params = nil

      match do |verb_to_path_map|
        expected_names = expected.select{|v| Symbol === v }
        expected_params = expected.select{|v| Hash === v }.first || {}
        expected_routes = expected_names.dup.tap{|exp| exp << expected_params }
        path = verb_to_path_map.values.first
        method = verb_to_path_map.keys.first
        begin
          self.send method, path
        rescue
          puts "something wrong"
        end
        last_route, last_params = *last_application.get_requested_routes_and_params
        last_name = last_route ? last_route.name : nil
        last_name == expected_names.join(" ").to_sym &&
          last_params == expected_params
      end

      failure_message do |actual|
        last_names = last_name.to_s.split(" ", 2).map(&:to_sym)
        last_names << last_params
        "expected #{actual.inspect} to route to #{expected_routes.inspect}, got #{last_names.inspect}"
      end

      failure_message_when_negated do |actual|
        last_names = last_name.to_s.split(" ", 2).map(&:to_sym)
        last_names << last_params
        "expected #{actual.inspect} not to route to #{expected.inspect}, got #{last_names.inspect}"
      end
    end

    matcher :be_routable do
      match do |verb_to_path_map|
        begin
          # compile Padrino's routing information
          Padrino.application.call(Rack::MockRequest.env_for("/"))
        end
        path = verb_to_path_map.values.first
        method = verb_to_path_map.keys.first.to_s.upcase
        @routed_to = Padrino.mounted_apps.map(&:app_obj).
          map{|a| a.router.recognize(Rack::MockRequest.env_for(path, method: method))}.first
        @routed_to.first
      end

      failure_message_when_negated do |path|
        "expected #{path.inspect} not to be routable, but it routes to #{@routed_to.inspect}"
      end
    end
  end
end
