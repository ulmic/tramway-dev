# frozen_string_literal: true

require 'tramway/helpers/class_name_helpers'

module Tramway
  module Admin
    class ApplicationController < ::Tramway::Core::ApplicationController
      include Tramway::ClassNameHelpers
      include Tramway::AuthManagement
      include RecordRoutesHelper
      before_action :authenticate_admin!
      before_action :application
      before_action :notifications
      before_action :notifications_count
      before_action :collections_counts, if: :model_given?
      before_action :check_available!
      before_action :check_available_scope!, if: :model_given?, only: :index

      protect_from_forgery with: :exception

      protected

      def check_available!
        raise 'Model or Form is not available' if !model_given? && !form_given?
      end

      def check_available_scope!
        raise 'Scope is not available' if params[:scope].present? && !available_scope_given?
      end

      def collections_counts
        @counts = decorator_class.collections.reduce({}) do |hash, collection|
          records = model_class.active.send(collection)
          records = records.send "#{current_user.role}_scope", current_user.id
          records = records.ransack(params[:filter]).result if params[:filter].present?
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
        @notifications_count = notifications&.reduce(0) do |count, notification|
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
        model_class_name(params[:model] || params[:form])
      end

      def decorator_class
        decorator_class_name
      end

      def admin_form_class
        "::#{current_user.role.camelize}::#{model_class}Form".constantize
      end

      def model_given?
        available_models_given? || singleton_models_given?
      end

      def form_given?
        # FIXME: add tramway error locales to the tramway admin gem
        # Tramway::Error.raise_error(
        #  :tramway, :admin, :application_controller, :form_given, :model_not_included_to_tramway_admin,
        #  model: params[:model]
        # )
        #raise "Looks like model #{params[:model]} is not included to tramway-admin for `#{current_user.role}` role. Add it in the `config/initializers/tramway.rb`. This way `Tramway::Admin.set_available_models(#{params[:model]})`"
        Tramway::Admin.forms.include? params[:form].underscore.sub(%r{^admin/}, '').sub(/_form$/, '')
      end

      def available_scope_given?
        params[:scope].present? && params[:scope].in?(decorator_class.collections.map(&:to_s))
      end

      def available_models_given?
        check_models_given? :available
      end

      def singleton_models_given?
        check_models_given? :singleton
      end

      private

      def check_models_given?(model_type)
        models = ::Tramway::Admin.send("#{model_type}_models", role: current_user.role)
        models.any? && params[:model].in?(models.map(&:to_s))
      end
    end
  end
end
