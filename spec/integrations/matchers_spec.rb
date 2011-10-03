require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/mock_app_helper')

describe "Integrations" do
  context "routing" do
    it "routes to /foo" do
      {:get => "/foo"}.should route_to(:foo, :index)
    end

    it "routes to /foo/create" do
      {:post => "/foo/create"}.should route_to(:foo, :create)
    end

    it "routes to /foo/assign" do
      {:get => "/foo/assign"}.should route_to(:foo, :assign)
    end

    it "routes to /foo/assign?hoge=1234" do
      {:get => "/foo/assign?hoge=1234"}.should route_to(:foo, :assign, :hoge => "1234")
    end

    it "is not routeble on /" do
      {:get => "/"}.should_not be_routable
    end

    it "is routable on /foo" do
      {:get => "/foo"}.should be_routable
    end

    it "is routable on /foo/create with method POST" do
      {:post => "/foo/create"}.should be_routable
    end
  end
end
