class Tramway::Landing::BlockDecorator < ::Tramway::Core::ApplicationDecorator
  class << self
    def collections
      [ :all ]
    end

    def list_attributes
      [ :position, :view_state, :block_type ]
    end
  end

  delegate :position, to: :object

  def block_type
    object.block_type_text
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
