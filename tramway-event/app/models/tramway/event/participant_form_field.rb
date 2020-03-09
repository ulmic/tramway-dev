# frozen_string_literal: true

class Tramway::Event::ParticipantFormField < ::Tramway::Event::ApplicationRecord
  belongs_to :event, class_name: 'Tramway::Event::Event'

  enumerize :field_type, in: %i[text string numeric date_picker select checkbox], default: :text

  scope :inputs_list, -> { active.order(position: :asc) }

  def required
    options.present? && options.dig('validations', 'presence') == 'true'
  end

  def validations
    (options == '' ? {} : options)&.dig('validations')
  end
end
