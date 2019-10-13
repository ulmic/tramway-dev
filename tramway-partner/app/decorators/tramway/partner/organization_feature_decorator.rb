# frozen_string_literal: true

class Tramway::Partner::OrganizationFeatureDecorator < ::Tramway::Landing::BlockTypes::FeaturesDecorator
  def image
    object.logo.mini.url
  end

  def external_link
    object.url
  end
end
