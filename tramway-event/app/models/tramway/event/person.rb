# frozen_string_literal: true

class Tramway::Event::Person < ::Tramway::Event::ApplicationRecord
  mount_uploader :photo, PhotoUploader
end
