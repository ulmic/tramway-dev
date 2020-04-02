# frozen_string_literal: true

class Tramway::Page::PageDecorator < ::Tramway::Core::ApplicationDecorator
  class << self
    def collections
      [:all]
    end
  end

  delegate :title, to: :object

  def lead
    object.body.first 200
  end

  def link
    Tramway::Page::Engine.routes.url_helpers.page_path slug: object.slug
  end

  def public_path
    Tramway::Page::Engine.routes.url_helpers.page_path slug: object.slug
  end
end
