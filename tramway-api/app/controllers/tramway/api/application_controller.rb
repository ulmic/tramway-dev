# frozen_string_literal: true

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
        return unauthorized if current_user.nil? || !params[:user_based_model].in?(Tramway::Api.user_based_models)
      end

      def auth_token
        if entity.respond_to? :to_token_payload
          ::Knock::AuthToken.new payload: entity.to_token_payload
        else
          ::Knock::AuthToken.new payload: { sub: entity.uid }
        end
      end

      def entity
        user_based_model = params[:user_based_model].constantize
        @entity ||=
          if user_based_model.respond_to? :from_token_request
            user_based_model.active.from_token_request request
          else
            params[:auth] && find_user_by_auth_attributes
          end
      end

      def find_user_by_auth_attributes
        user_based_model = params[:user_based_model].constantize
        Tramway::Api.auth_attributes[user_based_model].each do |attribute|
          object = user_based_model.active.where.not(attribute => nil).find_by(attribute => auth_params[:login])
          return object if object
        end
        nil
      end

      def auth_params
        params[:auth]&.permit(:login, :password)
      end

      def current_user
        Tramway::Api.user_based_models.map do |user_based_model|
          send("current_#{user_based_model.name.underscore}")
        end.compact.first
      end
    end
  end
end
