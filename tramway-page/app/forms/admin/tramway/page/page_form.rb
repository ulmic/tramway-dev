# frozen_string_literal: true

class Admin::Tramway::Page::PageForm < ::Tramway::ApplicationForm
  properties :title, :body, :slug, :view, :page_type, :view_state_event

  def initialize(object)
    super(object).tap do
      form_properties title: :string,
                      page_type: {
                        type: :default,
                        input_options: {
                          hint: 'View field will be ignored in Landing page type. You will configurate it with Blocks'
                        }
                      },
                      body: :ckeditor,
                      slug: :string,
                      view: :string
    end
  end
end
