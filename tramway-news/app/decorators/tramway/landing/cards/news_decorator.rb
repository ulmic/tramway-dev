# frozen_string_literal: true

class Tramway::Landing::Cards::NewsDecorator < ::Tramway::Landing::BlockTypes::CardsDecorator
  def image
    object.photo.card.url
  end

  def description
    object.body.first 200
  end

  def path
    "/news/#{object.id}"
  end
end
