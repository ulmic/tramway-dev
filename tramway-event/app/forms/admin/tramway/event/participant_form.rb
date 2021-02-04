# frozen_string_literal: true

require 'securerandom'

class Admin::Tramway::Event::ParticipantForm < ::Tramway::Core::ApplicationForm
  properties :comment
  association :event

  def self.new(object)
    if object.event_id.present?
      ::Tramway::Event::ParticipantExtendedFormCreator.create_form_class(
        SecureRandom.hex,
        object.event,
        comment: :string
      ).new object
    else
      super(object).tap do |obj|
        obj.form_properties event: :association
      end
    end
  end
end
