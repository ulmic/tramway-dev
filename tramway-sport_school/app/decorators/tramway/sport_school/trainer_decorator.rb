# frozen_string_literal: true

class Tramway::SportSchool::TrainerDecorator < ::Tramway::Core::ApplicationDecorator
  class << self
    def collections
      [:all]
    end

    def list_attributes
      [:view_state]
    end
  end

  def full_name
    "#{object.first_name} #{object.patronymic} #{object.last_name}"
  end

  def initial_short_name
    "#{object.last_name} #{object.first_name[0]}. #{object.patronymic[0]}."
  end

  alias title full_name

  delegate_attributes :photo, :degree, :description

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
