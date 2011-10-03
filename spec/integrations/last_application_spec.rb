require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/mock_app_helper')

describe "Integrations" do
  context "last_application" do
    subject { last_application }
    
    it "exists" do
      get "/foo"
      should_not be_nil
    end

    it "is an instance of PadrinoApp" do
      get "/foo"
      should be_kind_of(TestApp)
    end

    it "exists with assignment" do
      get "/foo/assign"
      last_application.assigns(:nonexist).should be_nil
      last_application.assigns(:assigned).should eq(1)
    end
  end
end
