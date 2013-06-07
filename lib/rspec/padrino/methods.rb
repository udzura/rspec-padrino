module RSpec
  module Padrino
    module Methods
      def last_application
        current_session.last_application
      end

      def app_helpers(app=nil)
        app ||= Padrino.mounted_apps.first.app_obj
        if app and app.ancestors.include?(Sinatra::Base)
          app.prototype.helpers
        else
          raise ArgumentError, "#{app} should be an subclass of Sinatra::Base"
        end
      end
    end
  end
end
