module Tramway
  module Admin
    module ApplicationHelper
      include ::FontAwesome::Rails::IconHelper
      include AuthManagment
      include AdditionalButtonsBuilder
      include RussianCasesHelper

      def title(page_title = default_title)
        title_text = "#{page_title} | #{t('application.name')}"
        content_for(:title) { title_text }
      end

      def default_title
        t('.title')
      end

      def page_title(action, model_name)
        t("helpers.actions.#{action}") + ' ' + genitive(model_name)
      end

      def customized_admin_navbar_given?
        customized_admin_navbar.present?
      end

      def customized_admin_navbar
        ::Tramway::Admin.customized_admin_navbar
      end
    end
  end
end
