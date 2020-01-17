# frozen_string_literal: true

module Tramway
  module Core
    class ApplicationController < ActionController::Base
      before_action :application

      def application
        @application = ::Tramway::Core.application_object
      end
    end
  end
end
