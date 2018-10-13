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
      include ::Tramway::Collections::Helper
    end
  end
end
