# frozen_string_literal: true

class Tramway::Landing::BlockDecorator < ::Tramway::Core::ApplicationDecorator
  class << self
    def collections
      [:all]
    end

    def list_attributes
      %i[page_link position view_state block_type]
    end

    delegate :human_view_state_event_name, to: :model_class
  end

  delegate_attributes :position, :title, :background, :anchor, :description, :view_name

  def public_path
    if object.published?
      Tramway::Page::Engine.routes.url_helpers.page_path slug: object.page.slug
    else
      Tramway::Page::Engine.routes.url_helpers.preview_path id: object.page.id
    end
  end

  def page_link
    if object.page.present?
      link_to object.page.title
    end
  end

  def block_type
    object.block_type_text
  end

  def view_state
    object.human_view_state_name
  end

  def link
    "##{object.anchor}"
  end

  def form_url
    object.values['form_url']
  end

  def view_state_button_color(event)
    case event
    when :publish
      :primary
    when :hide
      :secondary
    end
  end

  def button
    if object.button.present? && object.button['title'].present? && object.button['link'].present?
      content_tag :a, href: object.button['link'], target: '_blank', class: 'btn btn-primary' do
        object.button['title']
      end
    end
  end
end
