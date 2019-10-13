# frozen_string_literal: true

module Tramway
  module Auth
    module ApplicationHelper
      include AuthManagement
      include ::FontAwesome5::Rails::IconHelper
      include Tramway::Core::TitleHelper
      include Tramway::Admin::NavbarHelper
    end
  end
end
