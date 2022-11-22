# frozen_string_literal: true

module Tramway
  module Auth
    module ApplicationHelper
      include AuthManagement
      include ::FontAwesome5::Rails::IconHelper
      include Tramway::TitleHelper
      include Tramway::Admin::NavbarHelper
      include Tramway::Admin::CasesHelper
      include Tramway::Admin::RussianCasesHelper

      def decorator_class(model_name = nil)
        "#{model_name || model_class}Decorator".constantize
      end
    end
  end
end
