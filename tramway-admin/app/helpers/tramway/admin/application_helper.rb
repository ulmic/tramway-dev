module Tramway
  module Admin
    module ApplicationHelper
      include ::FontAwesome::Rails::IconHelper
      include AuthManagment
      include AdditionalButtonsBuilder
      include RussianCasesHelper
      include ::Tramway::Admin::RecordsHelper
      include ::Tramway::Admin::SingletonHelper
      include ::Tramway::Admin::NavbarHelper
      include ::Tramway::Admin::InputsHelper
      include ::Tramway::Admin::FocusGeneratorHelper
      include ::Tramway::Collections::Helper

      def object_type(object)
        ::Tramway::Admin.available_models_for(@application_engine || @application.name).map(&:to_s).include?(object.class.name) ? :record : :singleton
      end
    end
  end
end
