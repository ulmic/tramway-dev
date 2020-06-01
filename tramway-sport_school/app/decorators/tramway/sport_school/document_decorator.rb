# frozen_string_literal: true

class Tramway::SportSchool::DocumentDecorator < ::Tramway::Core::ApplicationDecorator
  class << self
    def collections
      [:all]
    end

    def list_attributes
      [:view_state]
    end

    def show_attributes
      [:title]
    end

    delegate :human_view_state_event_name, to: :model_class
  end

  delegate_attributes :title

  def view_state
    object.human_view_state_name
  end

  def view_state_button_color(event)
    case event
    when :publish
      :primary
    when :hide
      :secondary
    end
  end
end
