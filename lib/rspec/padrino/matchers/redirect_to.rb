module RSpec::Padrino::Matchers
  module RedirectTo
    extend RSpec::Matchers::DSL

    matcher :redirect_to do |*expected|
      expected_url = actual_url = nil

      match do |response|
        expected_url = last_application.absolute_url(*expected)
        actual_url = response.location
        response.redirect? && expected_url == actual_url
      end

      failure_message_for_should do |actual|
        "expected #{actual} to be a redirect to #{expected_url}, got #{actual_url.inspect}"
      end

      failure_message_for_should_not do |actual|
        "expected #{actual} not to be a redirect to #{expected_url}, got #{actual_url.inspect}"
      end
    end
  end
end
