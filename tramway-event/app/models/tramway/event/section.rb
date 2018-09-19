class Tramway::Event::Section < ::Tramway::Event::ApplicationRecord
  mount_uploader :photo, PhotoUploader

  belongs_to :event, class_name: 'Tramway::Event::Event'
end
