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

  delegate_attributes :title, :page_type, :body

  decorate_association :blocks, state_machines: [:view_state]

  def lead
    object.body.first 200
  end

  def link
    Tramway::Page::Engine.routes.url_helpers.page_path slug: object.slug
  end

  def public_path
    Tramway::Page::Engine.routes.url_helpers.page_path slug: object.slug if object.published?
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
