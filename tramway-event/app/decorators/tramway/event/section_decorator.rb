class Tramway::Event::SectionDecorator < ::Tramway::Landing::BlockTypes::FeaturesDecorator
  class << self
    def collections
      [ :all ]
    end
  end

  delegate :description, to: :object
  decorate_association :event
  decorate_association :partakings, decorator: Tramway::Event::PartakingFeatureDecorator

  def name
    "#{object.title} | #{object.event.title}"
  end

  def title
    "#{fa_icon(object.icon)} #{object.title}".html_safe
  end

  def background
    object.photo
  end

  def anchor
    "section-#{object.id}"
  end

  def event_title
    event.title
  end

  def event_duration
    event.duration
  end
end
