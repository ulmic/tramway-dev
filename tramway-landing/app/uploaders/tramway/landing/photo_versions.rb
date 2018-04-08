module Tramway::Landing::PhotoVersions
  extend ActiveSupport::Concern

  included do
    version :card do
      process resize_to_fill: [400, 400, 'North']
    end

    version :horizontal do
      process resize_to_fill: [1600, 700, 'Center']
    end
  end
end

PhotoUploader.include Tramway::Landing::PhotoVersions
