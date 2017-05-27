require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe RSpec::Padrino do
  it "can be included" do
    expect { include RSpec::Padrino }.not_to raise_error
  end

  it "includes RSpec::Padrino::* automatically" do
    module Foo
      include RSpec::Padrino
    end
    expect(Foo).to be_include(RSpec::Padrino::Methods)
    expect(Foo).to be_include(RSpec::Padrino::Matchers)
  end
end
