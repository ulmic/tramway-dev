# frozen_string_literal: true

class Tramway::Site::Person < Tramway::Site::ApplicationRecord
  mount_uploader :photo, PhotoUploader

  def title
    names.join(' ')
  end

  alias name title
  alias public_name title
end
