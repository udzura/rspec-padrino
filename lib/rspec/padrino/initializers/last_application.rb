require 'sinatrta/base'
require 'rack/test'
module Sinatra
  class Base
    attr_reader :last_app
    alias _call call
    def call(env)
      _dup = dup
      @last_app = _dup
      _dup._call(env)
    end
 
    def assigns(sym)
      instance_variables.include?("@#{sym}")
    end
  end
end

module Rack
  class MockSession
    alias original_request request
    def request(uri, env)
      ret = original_request(uri, env)
      @last_application = @app.last_app
      ret
    end
  end

  def last_application
    raise Rack::Test::Error.new("No application called yet. Request a page first.") unless @last_application
    @last_application
  end
end
