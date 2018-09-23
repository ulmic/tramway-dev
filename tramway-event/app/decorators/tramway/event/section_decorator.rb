class Tramway::Event::SectionDecorator < ::Tramway::Core::ApplicationDecorator
  class << self
    def collections
      [ :all ]
    end
  end

  def title
    "#{fa_icon(object.icon)} #{object.title}".html_safe
  end

  delegate :description, to: :object

  def background
    object.photo
  end

  def anchor
    "section-#{object.id}"
  end
end
