# frozen_string_literal: true

require 'tramway/collections/helper'

module Tramway
  module Event
    module ApplicationHelper
      include ::FontAwesome5::Rails::IconHelper
      include ::Tramway::Collections::Helper
      include ::Tramway::Profiles::LinksHelper
      include ::Tramway::Landing::ApplicationHelper
    end
  end
end
