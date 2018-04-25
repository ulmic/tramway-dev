module Tramway
  module User
    class ApplicationController < ActionController::Base
      layout ::Tramway::User.layout_path
      protect_from_forgery with: :exception
      before_action :application

      def application
        @application = ::Tramway::Core.application&.model_class&.first
      end
    end
  end
end
