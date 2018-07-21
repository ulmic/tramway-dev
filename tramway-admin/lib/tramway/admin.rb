require 'tramway/admin/engine'

module Tramway
  User.layout_path = 'tramway/admin/application'

  module Admin
    class << self
      def set_available_models(*models, project:)
        @available_models ||= {}
        @available_models[project] ||= []
        @available_models[project] += models
      end

      def available_models_for(project)
        (@available_models[project.to_sym] || []) + "::Tramway::#{project.to_s.camelize}".constantize.dependencies.map do |dependency|
          @available_models[dependency]
        end.flatten.compact
      end

      def available_models
        @available_models.values.flatten
      end

      def set_singleton_models(*models, project:)
        @singleton_models ||= {}
        @singleton_models[project] ||= []
        @singleton_models[project] += models
      end

      def singleton_models_for(project)
        (@singleton_models[project.to_sym] || []) + "::Tramway::#{project.to_s.camelize}".constantize.dependencies.map do |dependency|
          @singleton_models[dependency]
        end.flatten.compact
      end

      def singleton_models
        @singleton_models.values.flatten
      end

      def set_additional_buttons(buttons, project:)
        @additional_buttons ||= {}
        @additional_buttons[project] ||= {}
        @additional_buttons[project].merge! buttons
      end

      def additional_buttons(project:, view: nil, record: nil)
        @additional_buttons&.dig record, view
      end

      def customized_admin_navbar
        @customized_admin_navbar
      end
    end
  end
end
