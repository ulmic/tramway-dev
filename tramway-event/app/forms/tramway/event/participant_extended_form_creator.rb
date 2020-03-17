# frozen_string_literal: true

class Tramway::Event::ParticipantExtendedFormCreator < Tramway::Core::FormCreator
  def self.create_form_class(uuid, event, **simple_properties)
    class_name = "ParticipantExtendedForm#{uuid.gsub('-', '')}"
    properties = event.participant_form_fields.inputs_list.reduce({}) do |hash, field|
      hash.merge! field.title.to_sym => {
        object: field,
        validates: build_validations(field)
      }
    end
    if simple_properties.keys.any?
      ::Tramway::Core::ExtendableForm.new(class_name, simple_properties: simple_properties, **properties)
    else
      ::Tramway::Core::ExtendableForm.new(class_name, **properties)
    end
  end

  def self.build_validations(field)
    case field.field_type
    when 'checkbox'
      field.validations.except('presence').deep_merge! inclusion: { in: ['true'] }
    else
      field.validations
    end
  end
end
