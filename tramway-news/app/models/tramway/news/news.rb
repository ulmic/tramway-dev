# frozen_string_literal: true

class ::Tramway::News::News < ::Tramway::Core::ApplicationRecord
  mount_uploader :photo, PhotoUploader

  def author
    audits.where(action: :create).first.user
  end
end
