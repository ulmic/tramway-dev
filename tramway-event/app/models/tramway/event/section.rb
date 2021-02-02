# frozen_string_literal: true

class Tramway::Event::Section < ::Tramway::Core::ApplicationRecord
  mount_uploader :photo, PhotoUploader

  belongs_to :event, class_name: 'Tramway::Event::Event'
  has_many :partakings, as: :part, class_name: 'Tramway::Event::Partaking'
end
