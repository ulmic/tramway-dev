module Tramway
  module Landing
    class ApplicationController < ActionController::Base
      protect_from_forgery with: :exception

      def application
        ::Tramway::Core::Application.first
      end
    end
  end
end
