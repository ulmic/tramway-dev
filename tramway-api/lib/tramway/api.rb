require 'tramway/api/engine'

module Tramway
  module Api
    class << self
      def user_based_model
        @@user_based_model ||= ::Tramway::User::User
      end

      def user_based_model=(model_class)
        @@user_based_model = model_class
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
