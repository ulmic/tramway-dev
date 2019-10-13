# frozen_string_literal: true

class ::Tramway::Event::PartakingFeatureDecorator < ::Tramway::Landing::BlockTypes::FeaturesDecorator
  def text
    object.position&.html_safe
  end

  def full_text
    object.person.description
  end

  def title
    "#{object.person.first_name} #{object.person.last_name}"
  end

  def image
    object.person.photo.small.url
  end
end
