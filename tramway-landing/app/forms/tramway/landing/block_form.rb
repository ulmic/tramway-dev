class Tramway::Landing::BlockForm < ::Tramway::Core::ApplicationForm
  properties :title, :background, :view_state, :block_type, :position, :navbar_link, :anchor, :description, :link_object_type, :link_object_id

  def initialize(object = nil)
    form_object = super object
    form_properties title: :string,
                    background: :file,
                    position: :numeric,
                    block_type: :default,
                    navbar_link: :default,
                    anchor: :string,
                    description: :ckeditor,
                    link_object_type: :default,
                    link_object_id: :numeric
    form_object
  end
end
