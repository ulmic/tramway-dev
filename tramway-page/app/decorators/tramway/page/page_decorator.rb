# frozen_string_literal: true

class Tramway::Page::PageDecorator < ::Tramway::Core::ApplicationDecorator
  class << self
    def collections
      [:all]
    end

    def show_associations
      [:blocks]
    end
    delegate :human_view_state_event_name, to: :model_class
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
    if object.published?
      Tramway::Page::Engine.routes.url_helpers.page_path slug: object.slug
    else
      Tramway::Page::Engine.routes.url_helpers.preview_path id: object.id
    end
  end

  def view_state_button_color(event)
    case event
    when :publish
      :success
    when :hide
      :default
    end
  end
end
