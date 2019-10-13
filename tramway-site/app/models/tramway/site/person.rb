# frozen_string_literal: true

class Tramway::Site::Person < Tramway::Site::ApplicationRecord
  mount_uploader :photo, PhotoUploader

  def title
    names.join(' ')
  end
end
