# frozen_string_literal: true

module Tramway
  module Landing
    class ApplicationController < ActionController::Base
      protect_from_forgery with: :exception
      before_action :application

      def application
        if ::Tramway.application
          @application = Tramway.application&.model_class&.first || Tramway.application
        end
      end
    end
  end
end
