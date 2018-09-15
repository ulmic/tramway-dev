class Tramway::Event::ParticipantFormField < ::Tramway::Event::ApplicationRecord
  belongs_to :event, class_name: 'Tramway::Event::Event'

  enumerize :field_type, in: [ :text, :string, :numeric, :date_picker, :select ], default: :text

  scope :inputs_list, -> { active.order(position: :asc) }
end