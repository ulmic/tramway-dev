class Tramway::Event::ParticipantFormField < ::Tramway::Event::ApplicationRecord
  belongs_to :event, class_name: 'Tramway::Event::Event'
end
