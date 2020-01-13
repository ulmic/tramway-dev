# frozen_string_literal: true

class Tramway::Event::ParticipantFormFieldDecorator < ::Tramway::Core::ApplicationDecorator
  class << self
    def collections
      [:all]
    end

    def list_attributes
      [:event_title]
    end

    def show_attributes
      [:id,:title, :description, :field_type,:event_title,:state, :created_at, :updated_at, :options, :position ]
    end
  end

  def title
    "#{object.title} #{object.event.title}"
  end

  def event_title
    object.event.title
  end

  def description
    object.description
  end

  def field_type
    object.field_type
  end

  def state
    object.state
  end

  def created_at
    object.created_at
  end

  def updated_at
    object.updated_at
  end

  def options
    object.options
  end

  def position
    object.position
  end
end
