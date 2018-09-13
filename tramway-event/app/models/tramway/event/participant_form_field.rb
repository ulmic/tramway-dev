class Tramway::Event::ParticipantFormField < ::Tramway::Event::ApplicationRecord
  belongs_to :event, class_name: 'Tramway::Event::Event'

  enumerize :field_type, in: [ :text, :string, :numeric, :date_picker ], default: :text
end
