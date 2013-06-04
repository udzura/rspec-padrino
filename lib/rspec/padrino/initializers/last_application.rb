require 'sinatra/base'
require 'rack/test'

last_app = nil

Padrino::Application.class_eval do
  # Padrino does not override call! now in version,
  # So I override here
  define_method :call! do |*args|
    ret = nil
    begin
      ret = super(*args)
    ensure
      last_app = Thread.current['padrino.instance'] || self
    end
    return ret
  end

  def assigns(sym)
    valname = (RUBY_VERSION > '1.9') ? :"@#{sym}" : "@#{sym}"
    instance_variables.include?(valname) ? instance_variable_get(valname) : nil
  end

  def get_requested_routes_and_params
    [ request.route_obj, params ]
  end
end


Rack::MockSession.class_eval do
  alias original_request request
  undef :request
  define_method :request do |uri, env|
    ret = original_request(uri, env)
    @last_application = last_app
    ret
  end

  def last_application
    raise Rack::Test::Error.new("No application called yet. Request a page first.") unless @last_application
    @last_application
  end
end

module Rack::Test::Methods
  def last_application
    current_session.last_application
  end
end

class Rack::Test::Session
  def_delegator :@rack_mock_session, :last_application
end
