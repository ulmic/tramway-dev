class Tramway::Event::Event < ::Tramway::Event::ApplicationRecord
  mount_uploader :photo, PhotoUploader

  has_many :participants, class_name: 'Tramway::Event::Participant'
  has_many :participant_form_fields, class_name: 'Tramway::Event::ParticipantFormField'
end
