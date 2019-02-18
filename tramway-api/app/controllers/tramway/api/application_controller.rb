require 'tramway/api/authenticate_helper'

module Tramway
  module Api
    class ApplicationController < ::Tramway::Core::ApplicationController
      include Knock::Authenticable
      include ::Tramway::Api::AuthenticateHelper
      protect_from_forgery with: :null_session, if: proc { |c| c.request.format == 'application/json' }
      rescue_from ActiveRecord::RecordNotFound, with: :not_found

      private

      def not_found
        render json: { data: [] }, status: :not_found
      end
    end
  end
end
