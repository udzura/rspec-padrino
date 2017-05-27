module RSpec::Padrino::Matchers
  module RedirectTo
    extend RSpec::Matchers::DSL
    SCHEMA_REGEXP = /\A[A-z][A-z0-9\+\.\-]*:/.freeze

    matcher :redirect_to do |*expected|
      match do |response|
        @expected_url = make_expected_url(*expected)
        @actual_url = response.location
        response.redirect? && @expected_url == @actual_url
      end

      def make_expected_url(*args)
        head = args.first
        if args.length == 1 && head.kind_of?(String) && head =~ SCHEMA_REGEXP
          args.shift
        else
          last_application.absolute_url(*expected)
        end
      end

      failure_message do |actual|
        "expected #{actual} to be a redirect to #{@expected_url}, got #{@actual_url.inspect}"
      end

      failure_message_when_negated do |actual|
        "expected #{actual} not to be a redirect to #{@expected_url}, got #{@actual_url.inspect}"
      end
    end
  end
end
