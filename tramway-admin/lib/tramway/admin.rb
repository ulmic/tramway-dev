# frozen_string_literal: true

require 'tramway/admin/engine'
require 'tramway/admin/singleton_models'
require 'tramway/admin/records_models'
require 'tramway/admin/additional_buttons'
require 'tramway/error'

module Tramway
  Auth.layout_path = 'tramway/admin/application'

  module Admin
    class << self

      include ::Tramway::Admin::RecordsModels
      include ::Tramway::Admin::SingletonModels
      include ::Tramway::Admin::AdditionalButtons

      attr_reader :customized_admin_navbar

      def engine_class(project)
        class_name = "::Tramway::#{project.to_s.camelize}"
        class_name.classify.safe_constantize
      end

      def project_is_engine?(project)
        engine_class(project)
      end

      def get_models_by_key(checked_models, project, role)
        checked_models && checked_models != [] && checked_models[project][role] || []
      end

      def set_notificable_queries(**queries)
        @notificable_queries ||= {}
        @notificable_queries.merge! queries
      end

      def notifications
        @notificable_queries&.reduce({}) do |hash, notification|
          hash.merge! notification[0] => notification[1].call
        end
      end
    end
  end
end
