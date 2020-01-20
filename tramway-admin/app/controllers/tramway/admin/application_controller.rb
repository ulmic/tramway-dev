# frozen_string_literal: true

require 'tramway/helpers/class_name_helpers'

module Tramway
  module Admin
    class ApplicationController < ::Tramway::Core::ApplicationController
      include Tramway::AuthManagement
      include RecordRoutesHelper
      before_action :authenticate_admin!
      before_action :check_available!
      before_action :collections_counts, if: :model_given?
      before_action :check_available_scope!, if: :model_given?, only: :index
      before_action :application
      before_action :notifications
      before_action :notifications_count

      protect_from_forgery with: :exception

      protected

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
          records = model_class.active.send(collection)
          records = records.send "#{current_user.role}_scope", current_user.id
          hash.merge! collection => records.count
        end
      end

      def application
        if ::Tramway::Core.application
          @application = Tramway::Core.application&.model_class&.first || Tramway::Core.application
        end
      end

      def notifications
        @notifications ||= Tramway::Admin.notificable_queries&.reduce({}) do |hash, notification|
          hash.merge! notification[0] => notification[1].call(current_user)
        end
        @notifications
      end

      def notifications_count
        @notifications_count = notifications.reduce(0) do |count, notification|
          count += notification[1].count
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

      def admin_form_class
        if model_class.to_s.include? 'Tramway'
          form_class_name
        else
          "::Admin::#{model_class}Form".constantize
        end
      end

      def model_given?
        available_models_given? || singleton_models_given?
      end

      def available_scope_given?
        params[:scope].present? && params[:scope].in?(decorator_class.collections.map(&:to_s))
      end

      def available_models_given?
        models = ::Tramway::Admin.available_models(role: current_user.role)
        models.any? && params[:model].in?(models.map(&:to_s))
      end

      def singleton_models_given?
        ::Tramway::Admin.singleton_models.any? && params[:model].in?(::Tramway::Admin.singleton_models.map(&:to_s))
      end
    end
  end
end
