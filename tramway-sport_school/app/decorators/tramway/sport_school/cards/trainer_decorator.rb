class Tramway::SportSchool::Cards::TrainerDecorator < ::Tramway::Landing::BlockTypes::CardsDecorator
  def image
    object.photo.card.url
  end
  
  def title
    "#{object.last_name} #{object.first_name} #{object.patronymic}"
  end

  delegate :description, to: :object
end
