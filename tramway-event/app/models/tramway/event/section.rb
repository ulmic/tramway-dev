class Tramway::Event::Section < ::Tramway::Event::ApplicationRecord
  mount_uploader :photo, PhotoUploader

  belongs_to :event, class_name: 'Tramway::Event::Event'
  has_many :partakings, class_name: 'Tramway::Event::Partaking'
end
