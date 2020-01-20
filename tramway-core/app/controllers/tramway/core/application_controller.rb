# frozen_string_literal: true

module Tramway
  module Core
    class ApplicationController < ActionController::Base
      before_action :application
      before_action :load_extensions

      def application
        @application = ::Tramway::Core.application_object
      end

      def load_extensions
        if defined? ::Tramway::Extensions
          ::Tramway::Extensions.load
        end
      end
    end
  end
end
