class Tramway::Landing::BlockForm < ::Tramway::Core::ApplicationForm
  properties :title, :background, :view_state, :block_type, :position, :navbar_link, :anchor, :description

  def initialize(object)
    form_object = super object
    form_properties title: :string,
                    background: :file,
                    position: :numeric,
                    block_type: :default,
                    navbar_link: :default,
                    anchor: :string,
                    description: :default
    form_object
  end
end
