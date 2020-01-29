# frozen_string_literal: true

class Tramway::Event::ParticipantFormFieldForm < ::Tramway::Core::ExtendedApplicationForm
  properties :title, :description, :field_type, :options, :position, :list_field
  association :event

  def initialize(object)
    super(object).tap do
      form_properties event: :association,
                      title: :string,
                      description: :string,
                      field_type: :default,
                      options: :text,
                      list_field: :boolean,
                      position: :numeric
    end
  end

  def submit(params)
    super(params).tap do
      model.options = {} if model.options == ''
      model.options&.merge! list_field: (params[:list_field] == '1').to_s
      model.save
    end
  end

  def list_field
    model.options&.dig('list_field') == 'true'
  end

  def options
    model.options&.to_json
  end

  def options=(value)
    super value == '' ? value : JSON.parse(value)
  end
end
