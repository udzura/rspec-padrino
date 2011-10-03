require 'padrino-core'
require 'rack/test'

class TestApp < Padrino::Application
  register Padrino::Rendering
  enable :sessions
  set :session_secret, "fooo"
  disable :logging

  controllers :foo do
    get :index do
      "foo"
    end
    
    post :create do
      "foo"
    end

    get :assign do
      @assigned = 1
      "bar"
    end
  end
end

Padrino.mount("TestApp").to('/')
Padrino.load!

include Rack::Test::Methods
include RSpec::Padrino

def app
  Padrino.application
end
