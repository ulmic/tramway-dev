# frozen_string_literal: true

class Tramway::Event::PersonDecorator < ::Tramway::Core::ApplicationDecorator
  class << self
    def collections
      [:all]
    end
  end

  decorate_association :sections

  def name
    "#{object.first_name} #{object.last_name}"
  end
end
