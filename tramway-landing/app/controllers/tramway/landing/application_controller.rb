# frozen_string_literal: true

module Tramway
  module Landing
    class ApplicationController < ActionController::Base
      protect_from_forgery with: :exception
      before_action :application

      def application
        if ::Tramway::Core.application
          @application = Tramway::Core.application&.model_class&.first || Tramway::Core.application
        end
      end
    end
  end
end
