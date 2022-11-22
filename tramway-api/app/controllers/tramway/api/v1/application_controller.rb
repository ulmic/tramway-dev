# frozen_string_literal: true

module Tramway
  module Api
    module V1
      class ApplicationController < ::Tramway::Api::ApplicationController
        def render_errors_for(model)
          render json: model, status: :unprocessable_entity, serializer: ::Tramway::Api::V1::ErrorSerializer
        end

        def render_error_with_text(text)
          render json: { text: text }, status: :bad_request
        end

        def snake_case(params)
          hash = {}
          params.each do |attribute, value|
            key = ::UUID.validate(attribute) ? attribute : attribute.to_s.gsub('-', '_')
            hash.merge! key => value
          end
          hash
        end

        private

        def record
          if params[:key].present?
            if Tramway::Api.other_id_methods_of(model: model_class).include? params[:key].to_sym
              @record = model_class.find_by! params[:key] => params[:id] if params[:id].present?
            end
          else
            default_id_method = Tramway::Api.default_id_method_of(model: model_class) || :uuid
            @record = model_class.find_by! default_id_method => params[:id] if params[:id].present?
          end
        end

        def records
          active_records = model_class.respond_to?(:active) ? model_class.active : model_class.all
          collection = active_records.order(id: :desc).send params[:scope] || :all
          collection = collection.page(params[:page]).per(params[:per]) if params[:page].present?
          collection = collection.full_text_search params[:search] if params[:search].present?
          collection
        end

        def check_available_model_class
          unless model_class
            head(:unauthorized) && return unless current_tramway_user

            head(:unprocessable_entity) && return
          end
        end

        def check_available_model_action_for_record
          action_is_available = check_action
          action_is_available.tap do
            if action_is_available.is_a?(Proc) && !action_is_available.call(record, current_tramway_user)
              head(:unprocessable_entity) && return
            end
          end
        end

        def available_action_for_collection
          action_is_available = check_action
          return records if action_is_available == true

          action_is_available.call records, current_tramway_user if action_is_available.is_a?(Proc)
        end

        def check_action
          action_is_available = checking_roles.map do |role|
            Tramway::Api.action_is_available(
              action: action_name.to_sym,
              project: (@application_engine || application_name),
              role: role,
              model_name: params[:model],
              current_user: current_tramway_user
            )
          end.compact.uniq - [false]

          if action_is_available.count > 1
            Tramway::Error.raise_error(:tramway, :api, :api, :v1, :records_controller, :available_action_for_collection, :duplicate_actions)
          end

          action_is_available = action_is_available.first

          action_is_available.tap do
            head(:unprocessable_entity) && return unless action_is_available
          end
        end

        def authenticate_user_if_needed
          action_is_open = Tramway::Api.action_is_available(
            action: action_name.to_sym,
            project: (@application_engine || application_name),
            model_name: params[:model]
          )
          head(:unauthorized) && return if !current_tramway_user && !action_is_open
        end

        def available_models_for_current_tramway_user
          checking_roles.reduce([]) do |models, role|
            models += ::Tramway::Api.available_models(role: role).map(&:to_s)
          end
        end

        def checking_roles
          [:open, current_tramway_user&.role].compact
        end

        protected

        def application_name
          @application ||= Tramway.application&.model_class&.first || Tramway.application
          begin
            @application.name
          rescue
            raise("Tramway::Api @application not initialized, Tramway.application: #{::Tramway.application}, model_class: #{Tramway.application&.model_class }")
          end
        end

        def model_class
          params[:model].constantize
        rescue ActiveSupport::Concern::MultipleIncludedBlocks => e
          raise "#{e}. Maybe #{params[:model]} model doesn't exists or there is naming conflicts with it"
        end

        def decorator_class(model_name = nil)
          "#{model_name || model_class}Decorator".constantize
        end

        def form_class(model_name = nil)
          "#{model_name || model_class}Form".constantize
        end

        def serializer_class(model_name = nil)
          "#{model_name || model_class}Serializer".constantize
        end
      end
    end
  end
end
