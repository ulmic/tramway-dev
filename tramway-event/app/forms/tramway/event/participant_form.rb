class Tramway::Event::ParticipantForm < ::Tramway::Core::ApplicationForm
  properties :event_id, :values

  def initialize(object, event)
    form_object = super object
    form_properties event_id: :default
    form_object
  end
end
