require 'tramway/api/engine'

module Tramway
  module Api
    class << self
      def auth_config
        @@auth_config ||= { user_model: ::Tramway::User::User, auth_attributes: :email }
      end

      def auth_config=(**params)
        @@auth_config = params
      end

      def user_based_model
        @@auth_config[:user_model]
      end

      def auth_attributes
        @@auth_config[:auth_attributes]
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
