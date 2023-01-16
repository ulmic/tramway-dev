# frozen_string_literal: true

module Tramway
  module Conference
    class ApplicationController < ActionController::Base
      layout 'tramway/landing/application'
      protect_from_forgery with: :exception
      before_action :application

      def application
        @application = ::Tramway.application_object
      end
    end
  end
end
