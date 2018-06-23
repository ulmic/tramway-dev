class Tramway::Page::PageDecorator < ::Tramway::Core::ApplicationDecorator
  class << self
    def collections
      [ :all ]
    end
  end

  def lead
    object.body.first 200
  end

  def link
    Tramway::Page::Engine.routes.url_helpers.page_path slug: object.slug
  end
end
