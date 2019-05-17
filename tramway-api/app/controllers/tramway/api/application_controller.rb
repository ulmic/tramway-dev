module Tramway
  module Api
    class ApplicationController < ::Tramway::Core::ApplicationController
      include Knock::Authenticable
      protect_from_forgery with: :null_session, if: proc { |c| c.request.format == 'application/json' }
      rescue_from ActiveRecord::RecordNotFound, with: :not_found

      private

      def not_found
        render json: { data: [] }, status: :not_found
      end

      def unauthorized
        head :unauthorized
      end

      protected

      def authenticate
        return unauthorized unless current_user
      end

      def auth_token
        if entity.respond_to? :to_token_payload
          Knock::AuthToken.new payload: entity.to_token_payload
        else
          Knock::AuthToken.new payload: { sub: entity.id }
        end
      end

      def entity
        @entity ||=
          if Tramway::Api.user_based_model.respond_to? :from_token_request
            Tramway::Api.user_based_model.from_token_request request
          else
            params[:auth] && Tramway::Api.user_based_model.find_by(email: auth_params[:email])
          end
      end

      def auth_params
        params[:auth]&.permit :email, :password
      end
    end
  end
end
