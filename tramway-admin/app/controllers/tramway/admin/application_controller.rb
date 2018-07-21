module Tramway
  module Admin
    class ApplicationController < ::Tramway::Core::ApplicationController
      include AuthManagment
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
        @counts = "#{params[:model]}Decorator".constantize.collections.reduce({}) do |hash, collection|
          hash.merge! collection => params[:model].constantize.active.send(collection).count
        end
      end

      def model_class
        params[:model].constantize
      end

      def decorator_class
        "#{model_class}Decorator".constantize
      end

      def form_class
        "#{model_class}Form".constantize
      end

      def application
        @application = ::Tramway::Core.application&.model_class&.first
      end

      private

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
