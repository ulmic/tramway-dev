class Tramway::SportSchool::Features::KindSportDecorator < ::Tramway::Landing::BlockTypes::FeaturesDecorator
  def image
    object.image.small.url
  end

  delegate :title, to: :object

  def text
    object.description
  end
end
