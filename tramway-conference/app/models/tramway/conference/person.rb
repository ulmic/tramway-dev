class Tramway::Conference::Person < ::Tramway::Conference::ApplicationRecord
  has_and_belongs_to_many :sections, class_name: 'Tramway::Event::Section'

  mount_uploader :photo, PhotoUploader
end
