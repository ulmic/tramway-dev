require 'tramway/helpers/class_name_helpers'

module Tramway
  module Admin
    class ApplicationController < ::Tramway::Core::ApplicationController
      include AuthManagement
      include RecordRoutesHelper
      before_action :authenticate_admin!
      before_action :check_available!
      before_action :collections_counts, if: :model_given?
      before_action :check_available_scope!, if: :model_given?, only: :index
      before_action :application

      protect_from_forgery with: :exception

      def check_available!
        render '/404' unless model_given?
      end

      def check_available_scope!
        if params[:scope].present?
          render '/404' unless available_scope_given?
        end
      end

      def collections_counts
        @counts = decorator_class.collections.reduce({}) do |hash, collection|
          hash.merge! collection => model_class.active.send(collection).count
        end
      end

      def application
        if ::Tramway::Core.application
          @application = Tramway::Core.application&.model_class&.first || Tramway::Core.application
        end
      end

      if Rails.env.production?
        rescue_from StandardError do |exception|
          Rails.logger.warn "ERROR MESSAGE: #{exception.message}"
          Rails.logger.warn "BACKTRACE: #{exception.backtrace.first(30).join("\n")}"
          @exception = exception
          render 'tramway/admin/shared/errors/server_error', status: 500, layout: false
        end
      end

      include Tramway::ClassNameHelpers

      def model_class
        model_class_name(params[:model])
      end

      def decorator_class
        decorator_class_name
      end

      def form_class
        form_class_name
      end

      def model_given?
        available_models_given? || singleton_models_given?
      end

      def available_scope_given?
        params[:scope].present? && params[:scope].in?(decorator_class.collections.map(&:to_s))
      end

      def available_models_given?
        ::Tramway::Admin.available_models.any? && params[:model].in?(::Tramway::Admin.available_models.map(&:to_s))
      end

      def singleton_models_given?
        ::Tramway::Admin.singleton_models.any? && params[:model].in?(::Tramway::Admin.singleton_models.map(&:to_s))
      end
    end
  end
end
