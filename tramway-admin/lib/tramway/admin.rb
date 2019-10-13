# frozen_string_literal: true

require 'tramway/admin/engine'
require 'tramway/error'

module Tramway
  Auth.layout_path = 'tramway/admin/application'

  module Admin
    class << self
      def set_available_models(*models, project:)
        @available_models ||= {}
        @available_models[project] ||= []
        @available_models[project] += models
      end

      def available_models_for(project)
        if project_is_engine?(project)
          get_models_by_key(@available_models, project) + engine_class(project).dependencies.map do |dependency|
            if @available_models[dependency].present?
              @available_models[dependency]
            else
              error = Tramway::Error.new(
                plugin: :admin,
                method: :available_models_for,
                message: "There is no dependency `#{dependency}` for plugin: #{project}. Please, check file `tramway-#{project}/lib/tramway/#{project}/#{project}.rb`"
              )
              raise error
            end
          end.flatten.compact
        else
          get_models_by_key(@available_models, project)
        end
      end

      def available_models
        if @available_models
          @available_models.values.flatten
        else
          error = Tramway::Error.new(plugin: :admin, method: :available_models, message: 'List of available_models is empty. You should add some of them using `::Tramway::Admin.set_available_models(*list_of_classes, project: :your_project_name)` in `config/initializers/tramway.rb`')
          raise error.message
        end
      end

      def set_singleton_models(*models, project:)
        @singleton_models ||= {}
        @singleton_models[project] ||= []
        @singleton_models[project] += models
      end

      def singleton_models_for(project)
        if project_is_engine?(project)
          get_models_by_key(@singleton_models, project) + engine_class(project).dependencies.map do |dependency|
            @singleton_models[dependency]
          end.flatten.compact
        else
          get_models_by_key(@singleton_models, project)
        end
      end

      def singleton_models
        @singleton_models&.values&.flatten || []
      end

      def set_additional_buttons(buttons, project:)
        @additional_buttons ||= {}
        @additional_buttons[project] ||= {}
        @additional_buttons[project].merge! buttons
      end

      def additional_buttons(view: nil, record: nil, project: nil)
        @additional_buttons&.dig record, view
      end

      attr_reader :customized_admin_navbar

      def engine_class(project)
        class_name = "::Tramway::#{project.to_s.camelize}"
        class_name.classify.safe_constantize
      end

      def project_is_engine?(project)
        engine_class(project)
      end

      def get_models_by_key(checked_models, project)
        checked_models && checked_models != [] && checked_models[project.to_sym] || []
      end
    end
  end
end
