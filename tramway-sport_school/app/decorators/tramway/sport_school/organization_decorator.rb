class Tramway::SportSchool::OrganizationDecorator < ::Tramway::Core::ApplicationDecorator
  class << self
    def collections
      [ :all ]
    end

    def list_attributes
      [ :view_state ]
    end
  end

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
