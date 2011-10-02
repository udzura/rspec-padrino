module RSpec::Padrino::Matchers
  module RoutingMatchers
    last_params = nil
    last_name = nil
    Padrino::Application.class_eval do
      before do
        last_params = params
        last_name = request.route_obj.named
      end
    end

    extend RSpec::Matchers::DSL

    matcher :route_to do |*expected|
      expected_names = expected[0].select{|v| v === Symbol}
      expected_params = expected[0].select{|v| v === Hash}.first
      match do |verb_to_path_map|
        path, query = *verb_to_path_map.values.first.split('?')
        query = Rack::Utils::parse_query(query)
        method = verb_to_path_map.keys.first
        Padrino.application.call(Rack::MockRequest.env_for(verb_to_path_map.values.first, :method => method.to_s.upcase))
        last_name == expected_names.join("_").to_sym &&
          last_params.symbolyze_keys == expected_params.symbolyze_keys
      end
    end
  end
end
