# frozen_string_literal: true

class ::Tramway::Event::SectionFeatureDecorator < ::Tramway::Landing::BlockTypes::FeaturesDecorator
  delegate_attributes :icon, :title, :description

  def text
    object.description.scan(%r{<strong>.*?</strong>}).join(' ')
  end

  def image
    object.photo.small.url
  end

  def anchor
    "section-#{object.id}"
  end
end
