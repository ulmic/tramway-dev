class Tramway::Partner::OrganizationFeatureDecorator < ::Tramway::Landing::BlockTypes::FeaturesDecorator
  delegate :title, to: :object

  def text
    object.title
  end
  
  def image
    object.logo.small.url
  end
end
