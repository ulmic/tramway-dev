class ::Tramway::Event::SectionFeatureDecorator < ::Tramway::Core::ApplicationDecorator
  delegate :icon, to: :object
  delegate :title, to: :object
  delegate :description, to: :object

  def text
    object.description.scan(/<strong>.*?<\/strong>/).join(' ')
  end

  def image
    object.photo.small.url
  end

  def anchor
    "section-#{object.id}"
  end
end
