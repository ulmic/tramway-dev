class Tramway::Event::SectionDecorator < ::Tramway::Core::ApplicationDecorator
  class << self
    def collections
      [ :all ]
    end
  end

  delegate :title, to: :object
  delegate :description, to: :object

  def background
    object.photo
  end

  def anchor
    "section-#{object.id}"
  end
end
