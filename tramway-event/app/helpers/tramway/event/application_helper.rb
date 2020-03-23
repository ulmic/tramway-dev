# frozen_string_literal: true

require 'tramway/collections/helper'

module Tramway
  module Event
    module ApplicationHelper
      include ::FontAwesome5::Rails::IconHelper
      include ::Tramway::Collections::Helper
      include ::Tramway::Profiles::LinksHelper
    end
  end
end
