class Tramway::Event::SectionDecorator < ::Tramway::Landing::BlockTypes::FeaturesDecorator
  class << self
    def collections
      [ :all ]
    end
  end

  delegate :description, to: :object
  decorate_association :partakings, decorator: Tramway::Event::PartakingFeatureDecorator

  def title
    "#{fa_icon(object.icon)} #{object.title}".html_safe
  end

  def background
    object.photo
  end

  def anchor
    "section-#{object.id}"
  end
end
