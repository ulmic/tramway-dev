# frozen_string_literal: true

class Tramway::Page::PageDecorator < ::Tramway::Core::ApplicationDecorator
  class << self
    def collections
      [:all]
    end

    def show_associations
      [:blocks]
    end
  end

  delegate :title, to: :object

  decorate_association :blocks, state_machines: [:view_state]

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
