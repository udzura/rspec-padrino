require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Rspec::Padrino do
  it "can be included" do
    lambda { include Rspec::Padrino }.should_not raise_error
  end
  
  it "includes RSpec::Padrino::* automatically" do
    module Foo
      include RSpec::Padrino
    end
    Foo.should be_include(RSpec::Padrino::Methods)
    Foo.should be_include(RSpec::Padrino::Matchers)
  end
end
