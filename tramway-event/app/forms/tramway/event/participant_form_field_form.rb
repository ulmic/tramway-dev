class Tramway::Event::ParticipantFormFieldForm < ::Tramway::Core::ApplicationForm
  properties :title, :description, :field_type, :event

  def initialize(object)
    form_object = super object
    form_properties event: :association,
                    title: :string,
                    description: :string,
                    field_type: :default
    form_object
  end

  def event=(value)
    super ::Tramway::Event::Event.find value
  end
end
