module Tramway
  module User
    module ApplicationHelper
      include AuthManagment
      include ::FontAwesome::Rails::IconHelper

      def customized_admin_navbar_given?
        customized_admin_navbar.present?
      end

      def customized_admin_navbar
        ::Tramway::Admin.customized_admin_navbar
      end
    end
  end
end
