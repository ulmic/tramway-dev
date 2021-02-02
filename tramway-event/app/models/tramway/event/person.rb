# frozen_string_literal: true

class Tramway::Event::Person < ::Tramway::Core::ApplicationRecord
  mount_uploader :photo, PhotoUploader
end
