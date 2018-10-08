class Tramway::Event::ParticipantFormFieldDecorator < ::Tramway::Core::ApplicationDecorator
  class << self
    def collections
      [ :all ]
    end

    def list_attributes
      [:event_title]
    end
  end

  def event_title
    object.event.title
  end
end
