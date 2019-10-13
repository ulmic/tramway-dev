# frozen_string_literal: true

class Tramway::Landing::BlockForm < ::Tramway::Core::ExtendedApplicationForm
  properties :title,
             :background,
             :view_state,
             :block_type,
             :position,
             :navbar_link,
             :anchor,
             :description,
             :link_object_type,
             :link_object_id,
             :button_title,
             :button_link,
             :view_name

  def initialize(object = nil)
    super(object).tap do
      form_properties title: :string,
                      background: :file,
                      position: :numeric,
                      block_type: :default,
                      navbar_link: :default,
                      anchor: :string,
                      description: :ckeditor,
                      link_object_type: :default,
                      link_object_id: :numeric,
                      button_title: :string,
                      button_link: :string,
                      view_name: :string
    end
  end

  def button_title
    model.button ||= {}
    model.button['title'] || ''
  end

  def button_link
    model.button ||= {}
    model.button['link'] || ''
  end

  def button_title=(value)
    model.button ||= {}
    model.button[:title] = value
    model.save
  end

  def button_link=(value)
    model.button ||= {}
    model.button[:link] = value
    model.save
  end
end
