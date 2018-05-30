require 'tramway/admin/engine'

module Tramway
  User.layout_path = 'tramway/admin/application'

  module Admin
    class << self
      def set_available_models(*models)
        @available_models ||= []
        @available_models += models
      end

      def available_models
        @available_models
      end

      def set_singleton_models(*models)
        @singleton_models ||= []
        @singleton_models += models
      end

      def singleton_models
        @singleton_models
      end

      def set_additional_buttons(buttons)
        @additional_buttons ||= {}
        @additional_buttons.merge! buttons
      end

      def additional_buttons(view: nil, record: nil)
        @additional_buttons&.dig record, view
      end

      def customized_admin_navbar
        @customized_admin_navbar
      end
    end
  end
end
