# frozen_string_literal: true

class Tramway::Page::Page < Tramway::ApplicationRecord
  has_many :blocks, -> { order(position: :asc) }, class_name: 'Tramway::Landing::Block'

  enumerize :page_type, in: %i[main other without_layout], default: :other

  scope :landings, -> { where page_type: :landing }
  scope :published, -> { where view_state: :published }

  aasm :view_state, column: :view_state do
    state :unpublished, initial: true
    state :published

    event :publish do
      transitions from: :unpublished, to: :published
    end

    event :hide do
      transitions from: :published, to: :unpublished
    end
  end

  aasm do
    state :hack
  end
end
