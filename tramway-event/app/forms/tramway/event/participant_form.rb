require 'securerandom'

class Tramway::Event::ParticipantForm < ::Tramway::Core::ApplicationForm
  association :event

  def self.new(object)
    if object.event_id.present?
      ::Tramway::Event::ParticipantExtendedFormCreator.create_form_class(SecureRandom.hex, object.event).new object
    else
      super(object).tap do |obj|
        obj.form_properties event: :association
      end
    end
  end
end
