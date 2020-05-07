# frozen_string_literal: true

class Admin::Tramway::Landing::BlockForm < ::Tramway::Core::ExtendedApplicationForm
  association :page

  properties :title, :background, :view_state_event, :block_type, :position, :navbar_link, :anchor, :description,
    :link_object_type, :link_object_id, :button_title, :button_link, :view_name

  def initialize(object = nil)
    super(object).tap do
      form_properties page: :association,
                      title: :string,
                      background: :file,
                      position: {
                        type: :numeric,
                        input_options: {
                          hint: I18n.t('hints.tramway.landing.block.position', array: ::Tramway::Landing::Block.active.on_main_page.map(&:position).join(','))
                        }
                      },
                      block_type: :default,
                      navbar_link: :default,
                      anchor: :string,
                      description: :ckeditor,
                      button_title: :string,
                      button_link: :string,
                      view_name: :string
    end
  end
end
