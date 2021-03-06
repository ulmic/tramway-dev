# frozen_string_literal: true

class Tramway::SportSchool::InstitutionDecorator < ::Tramway::Core::ApplicationDecorator
  class << self
    def collections
      [:all]
    end
  end

  delegate_attributes :logo, :title
end
