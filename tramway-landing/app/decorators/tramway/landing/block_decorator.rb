# frozen_string_literal: true

class Tramway::Landing::BlockDecorator < ::Tramway::Core::ApplicationDecorator
  class << self
    def collections
      [:all]
    end

    def list_attributes
      %i[page_title position view_state block_type]
    end
    
    def show_associations
      [ :forms ]
    end

    delegate :human_view_state_event_name, to: :model_class
  end

  decorate_association :forms
  decorate_association :page

  delegate_attributes :position, :title, :background, :anchor, :description, :view_name

  def public_path
    if object.published?
      if object.page.slug.present?
        Tramway::Page::Engine.routes.url_helpers.page_path slug: object.page.slug
      end
    else
      Tramway::Page::Engine.routes.url_helpers.preview_path id: object.page.id
    end
  end

  def page_title
    object.page&.title
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

  def view_state_button_color(event)
    case event
    when :publish
      :primary
    when :hide
      :secondary
    end
  end

  def button
    if object.button.present? && object.button['button_title'].present? && object.button['button_link'].present?
      content_tag :a, href: object.button['button_link'], target: '_blank', class: 'btn btn-primary' do
        object.button['button_title']
      end
    end
  end
end
