require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/mock_app_helper')

describe "Integrations" do
  context "last_application" do
    subject { last_application }
    
    it "exists" do
      get "/foo"
      is_expected.not_to be_nil
    end

    it "is an instance of PadrinoApp" do
      get "/foo"
      is_expected.to be_kind_of(TestApp)
    end

    it "exists with assignment" do
      get "/foo/assign"
      expect(last_application.assigns(:nonexist)).to be_nil
      expect(last_application.assigns(:assigned)).to eq(1)
    end
  end
end
