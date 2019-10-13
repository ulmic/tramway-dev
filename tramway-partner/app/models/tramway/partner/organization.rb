# frozen_string_literal: true

module Tramway
  module Partner
    class Organization < ::Tramway::Partner::ApplicationRecord
      has_many :partnerships, class_name: 'Tramway::Partner::Partnership'

      mount_uploader :logo, PhotoUploader
    end
  end
end
