# frozen_string_literal: true

module Tramway
  module Conference
    class ApplicationController < ::Tramway::Core::ApplicationController
      layout 'tramway/landing/application'
      protect_from_forgery with: :exception
      before_action :application

      def application
        @application = ::Tramway::Core.application_object
      end
    end
  end
end
