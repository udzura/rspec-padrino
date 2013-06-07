require 'spec_helper'
require 'integrations/mock_app_helper'
require 'pry'

describe RSpec::Padrino::Methods do
  describe "#app_helpers" do
    subject { app_helpers(TestApp) }
    it { should respond_to :url_for }

    it "should render content tag" do
      subject.content_tag(:div, "foo").
        should == "<div>foo</div>"
    end

    it "should respond to a custom helper" do
      subject.foo_index_path.
        should == "/foo"
    end
  end
end
