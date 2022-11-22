# frozen_string_literal: true

class Tramway::Partner::OrganizationDecorator < ::Tramway::ApplicationDecorator
  class << self
    def collections
      [:all]
    end
  end

  decorate_association :partnerships

  delegate :title, to: :object
end
