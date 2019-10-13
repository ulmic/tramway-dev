# frozen_string_literal: true

class Tramway::SportSchool::Organization < ::Tramway::Core::ApplicationRecord
  mount_uploader :logo, PhotoUploader

  enumerize :organization_type, in: %i[required partner sponsor], default: :required

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
