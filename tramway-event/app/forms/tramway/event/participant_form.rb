require 'securerandom'

class Tramway::Event::ParticipantForm < ::Tramway::Core::ApplicationForm
  properties :participation_state, :comment
  association :event

  def self.new(object)
    if object.event_id.present?
      ::Tramway::Event::ParticipantExtendedFormCreator.create_form_class(
        SecureRandom.hex,
        object.event,
        comment: :string,
        participation_state: :string
      ).new object
    else
      super(object).tap do |obj|
        obj.form_properties event: :association
      end
    end
  end
end
