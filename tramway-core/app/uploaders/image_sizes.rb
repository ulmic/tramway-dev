module ImageSizes
  extend ActiveSupport::Concern

  included do
    version :medium do
      process :resize_to_fill => [400, 400]
    end

    version :small do
      process :resize_to_fill => [100, 100]
    end
  end
end
