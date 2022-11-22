# frozen_string_literal: true

class Tramway::Landing::FormDecorator < ::Tramway::ApplicationDecorator
  delegate_attributes :title, :form_name, :url
end
