# frozen_string_literal: true

require 'tramway/admin/engine'
require 'tramway/admin/singleton_models'
require 'tramway/admin/records_models'
require 'tramway/admin/additional_buttons'
require 'tramway/admin/notifications'
require 'tramway/admin/welcome_page_actions'
require 'tramway/error'

module Tramway
  Auth.layout_path = 'tramway/admin/application'

  module Admin
    class << self
      include ::Tramway::Admin::RecordsModels
      include ::Tramway::Admin::SingletonModels
      include ::Tramway::Admin::AdditionalButtons
      include ::Tramway::Admin::Notifications
      include ::Tramway::Admin::WelcomePageActions

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

      def models_array(models_type:, role:)
        instance_variable_get("@#{models_type}_models")&.map { |projects| projects[1][role] }&.flatten || []
      end
    end
  end
end
