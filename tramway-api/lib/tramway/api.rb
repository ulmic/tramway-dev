# frozen_string_literal: true

require 'tramway/api/engine'
require 'tramway/api/records_models'
require 'tramway/api/singleton_models'

module Tramway
  module Api
    class << self
      include ::Tramway::Api::RecordsModels
      include ::Tramway::Api::SingletonModels

      def auth_config
        @@auth_config ||= [{ user_model: ::Tramway::User::User, auth_attributes: :email }]
      end

      def auth_config=(params)
        if params.is_a? Hash
          @@auth_config = [params]
        elsif params.is_a? Array
          @@auth_config = params
        end
      end

      def user_based_models
        @@auth_config ||= []
        @@auth_config.map do |conf|
          conf[:user_model]
        end
      end

      def auth_attributes
        @@auth_config ||= []
        @@auth_config.reduce({}) do |hash, conf|
          hash.merge! conf[:user_model] => conf[:auth_attributes]
        end
      end

      def get_models_by_key(checked_models, project, role)
        unless project.present?
          error = Tramway::Error.new(
            plugin: :admin,
            method: :get_models_by_key,
            message: "Looks like you have not create at lease one instance of #{Tramway::Core.application.model_class} model"
          )
          raise error.message
        end
        checked_models && checked_models != [] && checked_models[project][role]&.keys || []
      end

      def models_array(models_type:, role:)
        instance_variable_get("@#{models_type}_models")&.map do |projects|
          projects.last[role]&.keys
        end&.flatten || []
      end

      def action_is_available(project:, role: :open, model_name:, action:, current_user: nil)
        actions = select_actions(project: project, role: role, model_name: model_name)
        raise "Looks like you did not used array type to define action permissions. Remember it should be this way: `#{model_name} => [ :#{action} ]` or `#{model_name} => [ { #{action}: lambda { |record, current_user| your_condition } } ]`" if actions.present? && !actions.is_a?(Array)
        availability = actions&.select do |a|
          if a.is_a? Symbol
            a == action.to_sym
          elsif a.is_a? Hash
            a.keys.first.to_sym == action.to_sym
          end
        end&.first

        return false unless availability.present?
        return true if availability.is_a? Symbol

        availability.values.first
      end

      def select_actions(project:, role:, model_name:)
        stringify_keys(@singleton_models&.dig(project, role))&.dig(model_name) || stringify_keys(@available_models&.dig(project, role))&.dig(model_name)
      end

      def stringify_keys(hash)
        hash&.reduce({}) do |new_hash, pair|
          new_hash.merge! pair[0].to_s => pair[1]
        end
      end
    end
  end
end
