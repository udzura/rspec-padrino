require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/mock_app_helper')

describe "Integrations" do
  context "routing" do
    it "routes to /foo" do
      expect({get: "/foo"}).to route_to(:foo, :index)
    end

    it "should not route to /bar" do
      expect({get: "/bar"}).not_to route_to(:bar, :index)
    end

    it "routes to /foo/create" do
      expect({post: "/foo/create"}).to route_to(:foo, :create)
    end

    it "routes to /foo/assign" do
      expect({get: "/foo/assign"}).to route_to(:foo, :assign)
    end

    it "routes to /foo/show/1" do
      expect({get: "/foo/show/1"}).to route_to(:foo, :show, "id" => "1")
    end

    it "routes to /custom/123/path" do
      expect({get: "/custom/123/path"}).to route_to(:foo, :show2, "id" => "123")
    end

    it "routes to /foo/assign?par=ams" do
      expect({get: "/foo/assign?par=ams"}).to route_to(:foo, :assign, "par" => "ams")
    end

    pending "Fails only in travis ci, passes locally" do
      it "routes to /foo/errored if it has error" do
        expect({get: "/foo/errored"}).to route_to(:foo, :errored)
      end
    end

    it "is not routeble on /" do
      expect({get: "/"}).not_to be_routable
    end

    it "is routable on /foo" do
      expect({get: "/foo"}).to be_routable
    end

    it "is routable on /foo/show/1" do
      expect({get: "/foo/show/1"}).to be_routable
    end

    it "is routable on /custom/123/path" do
      expect({get: "/custom/123/path"}).to be_routable
    end

    it "is routable on /foo?par=ams" do
      expect({get: "/foo?par=ams"}).to be_routable
    end

    it "is routable on /foo/create with method POST" do
      expect({post: "/foo/create"}).to be_routable
    end

    it "is routable on /foo/errored" do
      expect({get: "/foo/errored"}).to be_routable
    end
  end

  describe "redirect_to" do
    subject { last_response }

    context "with optional style" do
      it "redirects to /baz/show" do
        get "/baz"
        is_expected.to redirect_to(:baz, :show)
      end

      it "redirects to /baz/captures/123" do
        get "/baz/redirect_with_captures/123"
        is_expected.to redirect_to(:baz, :captures, id: 123)
      end

      it "should fail if does not redirect" do
        get "/baz/captures/123"
        is_expected.not_to redirect_to(:baz, :captures, id: 123)
      end

      it "should not fail even if only one argument is an instance of non-string" do
        get "/cushion", q: "/one"
        is_expected.to redirect_to(:one)
      end
    end

    context "with URI" do
      it "redirects to /baz/show" do
        get "/baz"
        is_expected.to redirect_to("/baz/show")
      end

      it "redirects to /baz/captures/123" do
        get "/baz/redirect_with_captures/123"
        is_expected.to redirect_to("/baz/captures/123")
      end

      it "should fail if does not redirect" do
        get "/baz/captures/123"
        is_expected.not_to redirect_to("/baz/captures/123")
      end
    end

    context "with absolute URI" do
      it "redirects to http://example.com" do
        get "/cushion", q: "http://example.com"
        is_expected.to redirect_to("http://example.com")
      end

      it "redirects to ftp://example.com" do
        get "/cushion", q: "ftp://example.com"
        is_expected.to redirect_to("ftp://example.com")
      end
    end
  end
end
