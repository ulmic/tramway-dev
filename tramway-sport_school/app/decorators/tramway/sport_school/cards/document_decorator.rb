# frozen_string_literal: true

class Tramway::SportSchool::Cards::DocumentDecorator < ::Tramway::Landing::BlockTypes::CardsDecorator
  def image
    object.file.url if object.file.url.include?('.jpg')
  end

  delegate :title, to: :object

  def description
    nil
  end

  def path
    object.file.url
  end
end
