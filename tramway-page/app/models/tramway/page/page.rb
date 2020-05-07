# frozen_string_literal: true

class Tramway::Page::Page < ::Tramway::Core::ApplicationRecord
  has_many :blocks, -> { order(position: :asc) }, class_name: 'Tramway::Landing::Block'

  enumerize :page_type, in: %i[main other], default: :other

  scope :landings, -> { where page_type: :landing }
  scope :published, -> { where view_state: :published }

  state_machine :view_state, initial: :unpublished do
    state :unpublished
    state :published

    event :publish do
      transition unpublished: :published
    end

    event :hide do
      transition published: :unpublished
    end
  end
end
