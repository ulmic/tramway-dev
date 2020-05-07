# frozen_string_literal: true

class Admin::Tramway::Event::ParticipantFormFieldForm < ::Tramway::Core::ExtendedApplicationForm
  properties :title, :description, :field_type, :options, :position, :list_field, :presence_field, :select_options
  association :event

  def initialize(object)
    super(object).tap do
      form_properties event: :association,
                      title: :string,
                      description: :string,
                      field_type: :default,
                      options: :text,
                      list_field: :boolean,
                      presence_field: :boolean,
                      position: :numeric,
                      select_options: {
                        type: :string,
                        input_options: {
                          hint: I18n.t('hints.tramway.event.participant_form_field.select_options')
                        }
                      }
    end
  end

  def submit(params)
    super(params).tap do
      model.options = {} if model.options == ''
      model.options&.merge! list_field: (params[:list_field] == '1').to_s
      model.options&.deep_merge! collection: { array: params[:select_options].split(',') || [] }
      model.options&.deep_merge! validations: { presence: (params[:presence_field] == '1').to_s }
      model.save
    end
  end

  def list_field
    model.options.present? && model.options.dig('list_field') == 'true'
  end

  def presence_field
    model.options.present? && model.options.dig('validations', 'presence') == 'true'
  end

  def select_options
    model.options.present? && model.options.dig('collection', 'array')&.join(',')
  end

  def options
    model.options&.to_json
  end

  def options=(value)
    model.options = value == '' ? value : JSON.parse(value)
  end
end
