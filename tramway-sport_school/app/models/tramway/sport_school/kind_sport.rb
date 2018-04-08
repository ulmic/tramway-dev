module Tramway::SportSchool
  class KindSport < ::Tramway::Core::ApplicationRecord
    mount_uploader :image, PhotoUploader

    state_machine :view_state, initial: :published do
      state :published
      state :hidden

      event :publish do
        transition hidden: :published
      end

      event :hide do
        transition published: :hidden
      end
    end

    scope :published, -> { where view_state: :published }
    scope :hidden, -> { where view_state: :hidden }
  end
end
