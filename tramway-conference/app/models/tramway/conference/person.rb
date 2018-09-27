class Tramway::Conference::Person < ::Tramway::Conference::ApplicationRecord
  has_and_belongs_to_many :events, class_name: 'Tramway::Event::Event'

  mount_uploader :photo, PhotoUploader
end
