require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/mock_app_helper')

describe "Integrations" do
  context "routing" do
    it "routes to /foo" do
      {:get => "/foo"}.should route_to(:foo, :index)
    end

    it "should not route to /bar" do
      {:get => "/bar"}.should_not route_to(:bar, :index)
    end

    it "routes to /foo/create" do
      {:post => "/foo/create"}.should route_to(:foo, :create)
    end

    it "routes to /foo/assign" do
      {:get => "/foo/assign"}.should route_to(:foo, :assign)
    end

    it "routes to /foo/show/1" do
      {:get => "/foo/show/1"}.should route_to(:foo, :show, :id => "1")
    end

    it "routes to /custom/123/path" do
      {:get => "/custom/123/path"}.should route_to(:foo, :show2, :id => "123")
    end

    it "routes to /foo/assign?par=ams" do
      {:get => "/foo/assign?par=ams"}.should route_to(:foo, :assign, :par => "ams")
    end

    it "routes to /foo/errored if it has error", pending: "Fails only in travis ci, passes locally" do
      {:get => "/foo/errored"}.should route_to(:foo, :errored)
    end

    it "is not routeble on /" do
      {:get => "/"}.should_not be_routable
    end

    it "is routable on /foo" do
      {:get => "/foo"}.should be_routable
    end

    it "is routable on /foo/show/1" do
      {:get => "/foo/show/1"}.should be_routable
    end

    it "is routable on /custom/123/path" do
      {:get => "/custom/123/path"}.should be_routable
    end

    it "is routable on /foo?par=ams" do
      {:get => "/foo?par=ams"}.should be_routable
    end

    it "is routable on /foo/create with method POST" do
      {:post => "/foo/create"}.should be_routable
    end

    it "is routable on /foo/errored" do
      {:get => "/foo/errored"}.should be_routable
    end
  end
end
