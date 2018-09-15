class Tramway::Event::EventDecorator < ::Tramway::Core::ApplicationDecorator
  class << self
    def collections
      [ :all ]
    end
  end

  delegate :title, to: :object
  delegate :participant_form_fields, to: :object

  def background
    object.photo
  end

  def tagline
    ''
  end
end