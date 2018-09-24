class Tramway::Event::ParticipantExtendedFormCreator
  def self.create_form_class(uuid, event)
    class_name = "ParticipantExtendedForm#{uuid.gsub('-', '')}"
    ::Tramway::Core::ExtendableForm.new(class_name, *event.participant_form_fields.inputs_list.map(&:title).map(&:to_sym))
  end
end
