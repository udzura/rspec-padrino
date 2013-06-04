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

    get :show, :with => :id do
      "foo"
    end

    get :show2, '/custom/:id/path' do
      "foo"
    end

    post :create do
      "foo"
    end

    get :assign do
      @assigned = 1
      "bar"
    end

    get :errored do
      raise "Some error, but routable"
    end
  end
end

Padrino.mount("TestApp").to('/')
Padrino.load!

RSpec.configure do |c|
  c.include Rack::Test::Methods
  c.include RSpec::Padrino
end

def app
  Padrino.application
end
