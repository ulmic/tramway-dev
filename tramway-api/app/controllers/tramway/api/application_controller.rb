# frozen_string_literal: true

module Tramway
  module Api
    class ApplicationController < ::Tramway::Core::ApplicationController
      include ::Knock::Authenticable
      protect_from_forgery with: :null_session, if: proc { |c| c.request.format == 'application/json' }
      rescue_from ActiveRecord::RecordNotFound, with: :not_found if Rails.env.production?
      before_action :load_application

      def load_application
        if engine_loaded(request).present?
          build_application_with_engine engine_loaded request
        elsif application_class(request).present?
          @application = application_class(request).camelize.constantize.first
        else
          @application = application_object request
        end
      end

      private

      def build_application_with_engine(engine_loaded)
        engine_module = "::Tramway::#{engine_loaded.camelize}".constantize
        @application = "#{engine_module}::#{engine_module.application.to_s.camelize}".constantize.first
        @application_engine = engine_loaded
      end

      def application_class(request)
        Constraints::DomainConstraint.new(request.domain).application_class
      end

      def engine_loaded(request)
        Constraints::DomainConstraint.new(request.domain).engine_loaded
      end

      def application_object(request)
        Constraints::DomainConstraint.new(request.domain).application_object
      end

      def not_found
        render json: { data: [] }, status: :not_found
      end

      def unauthorized
        head :unauthorized
      end

      def authenticate
        return if current_user || params[:user_based_model].in?(Tramway::Api.user_based_models)

        unauthorized
      end

      protected

      def auth_token
        if entity.respond_to? :to_token_payload
          ::Knock::AuthToken.new payload: entity.to_token_payload
        else
          ::Knock::AuthToken.new payload: { sub: entity.uuid }
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
          send("current_#{user_based_model.name.underscore}") unless user_based_model == User
        end.compact.first
      end
    end
  end
end
