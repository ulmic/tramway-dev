module Tramway
  module User
    module ApplicationHelper
      include AuthManagment
      include ::FontAwesome::Rails::IconHelper
      include Tramway::Core::TitleHelper
      include Tramway::Admin::NavbarHelper
    end
  end
end
