# frozen_string_literal: true

module Tramway
  module Admin
    module ApplicationHelper
      include ::FontAwesome5::Rails::IconHelper
      include AuthManagement
      include AdditionalButtonsBuilder
      include CasesHelper
      include RussianCasesHelper
      include ::Tramway::Admin::RecordsHelper
      include ::Tramway::Admin::SingletonHelper
      include ::Tramway::Admin::NavbarHelper
      include ::Tramway::Admin::InputsHelper
      include ::Tramway::Admin::FocusGeneratorHelper
      include ::Tramway::Collections::Helper

      def object_type(object)
        object_class_name = if object.class.ancestors.include? ::Tramway::Core::ApplicationDecorator
                              object.class.model_class.name
                            else
                              object.class.name
                            end
        ::Tramway::Admin.available_models_for(@application_engine || @application.name).map(&:to_s).include?(object_class_name) ? :record : :singleton
      end
    end
  end
end
