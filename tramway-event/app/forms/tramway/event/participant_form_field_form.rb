# frozen_string_literal: true

class Tramway::Event::ParticipantFormFieldForm < ::Tramway::Core::ApplicationForm
  properties :title, :description, :field_type, :options, :position
  association :event

  def initialize(object)
    super(object).tap do
      form_properties event: :association,
        title: :string,
        description: :string,
        field_type: :default,
        options: :text,
        position: :numeric
    end
  end

  def options
    model.options&.to_json
  end

  def options=(value)
    super value == '' ? value : JSON.parse(value)
  end
end
