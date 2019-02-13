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
    end
  end
end
