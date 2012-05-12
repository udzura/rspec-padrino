require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../../integrations/mock_app_helper')

describe RSpec::Padrino::Matchers do
  describe 'RoutingMatchers.hook! adds a filter' do
    subject { TestApp.filters[:after] }
    before { RSpec::Padrino::Matchers::RoutingMatchers.hook! }
    it { should have(1).filter }

    describe 'should not add second filter hook' do
      before { RSpec::Padrino::Matchers::RoutingMatchers.hook! }
      it { should have(1).filter }
    end
  end
end
