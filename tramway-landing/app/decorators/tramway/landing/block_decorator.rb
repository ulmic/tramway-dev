class Tramway::Landing::BlockDecorator < ::Tramway::Core::ApplicationDecorator
  class << self
    def collections
      [ :all ]
    end

    def list_attributes
      [ :position, :view_state ]
    end
  end

  delegate :position, to: :object

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
