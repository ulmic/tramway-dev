module Tramway
  module SportSchool
    class ApplicationController < ActionController::Base
      layout 'tramway/landing/application'
      protect_from_forgery with: :exception
      before_action :application

      def application
        @application = ::Tramway::Core.application.model_class.first
      end
    end
  end
end
