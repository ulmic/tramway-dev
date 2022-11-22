# frozen_string_literal: true

module Tramway
  module SportSchool
    class ApplicationController < ::Tramway::ApplicationController
      layout 'tramway/landing/application'
      protect_from_forgery with: :exception
      before_action :application

      def application
        @application = ::Tramway.application.model_class.first
      end
    end
  end
end
