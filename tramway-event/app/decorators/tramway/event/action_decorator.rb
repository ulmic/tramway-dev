# frozen_string_literal: true

class Tramway::Event::ActionDecorator < Tramway::Core::ApplicationDecorator
  class << self
    delegate :human_action_state_event_name, to: :model_class
    delegate :human_attribute_name, to: :model_class
  end

  def name
    "#{object.title} - #{date_view(object.deadline)} - #{state_machine_view(object, :action_state)}"
  end

  def title
    object.title
  end

  def action_state_button_color(event)
    case event
    when :do
      :success
    when :decline
      :danger
    when :return
      :warning
    end
  end
end
