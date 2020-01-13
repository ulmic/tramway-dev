# frozen_string_literal: true

require 'tramway/export/engine'

module Tramway
  module Export
    class << self
      def set_exportable_models(*models, project:)
        @exportable_models ||= {}
        @exportable_models[project] ||= []
        @exportable_models[project] += models
      end

      def exportable_model?(model_class, project:)
        return false unless project.present?

        @exportable_models[project.to_sym]&.include? model_class
      end
    end
  end
end
