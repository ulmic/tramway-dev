module Tramway
  module Auth
    module ApplicationHelper
      include AuthManagment
      include ::FontAwesome5::Rails::IconHelper
      include Tramway::Core::TitleHelper
      include Tramway::Admin::NavbarHelper
    end
  end
end
