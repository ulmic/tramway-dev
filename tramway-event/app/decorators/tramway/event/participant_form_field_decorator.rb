# frozen_string_literal: true

class Tramway::Event::ParticipantFormFieldDecorator < ::Tramway::Core::ApplicationDecorator
  class << self
    def collections
      [:all]
    end

    def list_attributes
      [:event_title]
    end
  end

  def title
    "#{object.title} #{object.event.title}"
  end

  def event_title
    object.event.title
  end
end
