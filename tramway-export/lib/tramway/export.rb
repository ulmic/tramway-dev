# frozen_string_literal: true

require 'tramway/export/engine'

module Tramway
  module Export
    class << self
      def set_exportable_models(*models, project:)
        @exportable_models ||= {}
        @exportable_models[project.to_sym] ||= []
        @exportable_models[project.to_sym] += models
      end

      def exportable_models(project:)
        @exportable_models[project.to_sym]
      end

      def exportable_model?(model_class, project:)
        return false unless project.present?

        @exportable_models[project.to_sym]&.map(&:to_s)&.include?(model_class.to_s) ||
          @exportable_models[project.to_sym]&.map { |config| config.is_a?(Hash) && config.keys.first.to_s == model_class.to_s }&.include?(true)
      end
    end
  end
end
