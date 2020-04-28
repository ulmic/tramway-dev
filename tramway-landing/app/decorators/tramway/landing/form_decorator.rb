# frozen_string_literal: true

class Tramway::Landing::FormDecorator < ::Tramway::Core::ApplicationDecorator
  delegate_attributes :title
end
