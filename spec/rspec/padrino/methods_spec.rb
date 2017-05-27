require 'spec_helper'
require 'integrations/mock_app_helper'
require 'pry'

describe RSpec::Padrino::Methods do
  describe "#app_helpers" do
    subject { app_helpers(TestApp) }
    it { is_expected.to respond_to :url_for }

    it "should render content tag" do
      expect(subject.content_tag(:div, "foo")).
        to eq("<div>foo</div>")
    end

    it "should respond to a custom helper" do
      expect(subject.foo_index_path).
        to eq("/foo")
    end
  end
end
