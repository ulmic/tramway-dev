# frozen_string_literal: true

module Tramway::SportSchool
  class Trainer < ::Tramway::Core::ApplicationRecord
    enumerize :degree, in: %i[master_of_sport candidate_master_of_sports]

    mount_uploader :photo, PhotoUploader

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

    scope :published, -> { active.where view_state: :published }
    scope :hidden, -> { active.where view_state: :hidden }
  end
end
