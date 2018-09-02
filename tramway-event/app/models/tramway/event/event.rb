class Tramway::Event::Event < ::Tramway::Event::ApplicationRecord
  mount_uploader :photo, PhotoUploader
end
