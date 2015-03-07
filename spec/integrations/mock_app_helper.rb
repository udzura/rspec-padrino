require 'padrino-core'
require 'padrino-helpers'
require 'rack/test'

class TestApp < Padrino::Application
  register Padrino::Rendering
  register Padrino::Helpers
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

  controllers :baz do
    get :index do
      redirect url(:baz, :show)
    end

    get :show do
      "show"
    end

    get :redirect_with_captures, :with => :id do |id|
      redirect url(:baz, :captures, :id => id)
    end

    get :captures, :with => :id do |id|
      "with #{id}"
    end
  end

  get(:one){}

  get :cushion do
    redirect params[:q]
  end

  helpers do
    def foo_index_path
      url_for(:foo, :index)
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
