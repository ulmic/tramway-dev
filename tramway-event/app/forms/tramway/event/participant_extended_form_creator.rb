class Tramway::Event::ParticipantExtendedFormCreator < Tramway::Core::FormCreator
  def self.create_form_class(uuid, event, *simple_properties)
    class_name = "ParticipantExtendedForm#{uuid.gsub('-', '')}"
    properties = event.participant_form_fields.inputs_list.reduce({}) do |hash, field|
      hash.merge! field.title.to_sym => field
    end
    if simple_properties.any?
      ::Tramway::Core::ExtendableForm.new(class_name, *simple_properties, **properties)
    else
      ::Tramway::Core::ExtendableForm.new(class_name, **properties)
    end
  end
end
