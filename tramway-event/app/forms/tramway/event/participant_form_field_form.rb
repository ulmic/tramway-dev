class Tramway::Event::ParticipantFormFieldForm < ::Tramway::Core::ApplicationForm
  properties :title, :description, :field_type, :event, :options, :position

  def initialize(object)
    form_object = super object
    form_properties event: :association,
                    title: :string,
                    description: :string,
                    field_type: :default,
                    options: :text,
                    position: :numeric
    form_object
  end

  def event=(value)
    super ::Tramway::Event::Event.find value
  end

  def options
    model.options.to_json
  end

  def options=(value)
    super JSON.parse value
  end
end
