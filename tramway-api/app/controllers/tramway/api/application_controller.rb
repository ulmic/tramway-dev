module Tramway
  module Api
    class ApplicationController < ::Tramway::Core::ApplicationController
      include ::Knock::Authenticable
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
          ::Knock::AuthToken.new payload: entity.to_token_payload
        else
          ::Knock::AuthToken.new payload: { sub: entity.id }
        end
      end

      def entity
        @entity ||=
          if Tramway::Api.user_based_model.respond_to? :from_token_request
            Tramway::Api.user_based_model.active.from_token_request request
          else
            params[:auth] && find_user_by_auth_attributes
          end
      end

      def find_user_by_auth_attributes
        Tramway::Api.auth_attributes.each do |attribute|
          object = Tramway::Api.user_based_model.active.where.not(attribute => nil).find_by(attribute => auth_params[:login])
          return object if object
        end
        nil
      end

      def auth_params
        params[:auth]&.permit(:login, :password)
      end
    end
  end
end
