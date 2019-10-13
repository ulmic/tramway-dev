# frozen_string_literal: true

require 'tramway/api/engine'

module Tramway
  module Api
    class << self
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
        @@auth_config.map do |conf|
          conf[:user_model]
        end
      end

      def auth_attributes
        @@auth_config.reduce({}) do |hash, conf|
          hash.merge! conf[:user_model] => conf[:auth_attributes]
        end
      end

      def set_available_models(**models)
        @@available_models ||= {}
        models = models.reduce({}) do |hash, pair|
          hash.merge! pair[0].to_s.camelize => pair[1]
        end
        @@available_models.merge! models
      end

      def available_models
        @@available_models ||= {}
      end
    end
  end
end
