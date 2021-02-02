# frozen_string_literal: true

class Tramway::Event::Participant < ::Tramway::Core::ApplicationRecord
  belongs_to :event, class_name: 'Tramway::Event::Event'

  aasm :participation_state do
    state :requested, initial: true
    state :prev_approved
    state :waiting
    state :rejected
    state :approved
    state :without_answer
    state :reserved

    event :previous_approve do
      transitions from: %i[requested without_answer waiting], to: :prev_approved
    end

    event :wait_for_decision do
      transitions from: %i[requested without_answer], to: :waiting
    end

    event :reserve do
      transitions from: %i[requested without_answer waiting], to: :reserved
    end

    event :reject do
      transitions from: %i[requested without_answer waiting prev_approved reserved], to: :rejected
    end

    event :approve do
      transitions from: %i[prev_approved reserved requested], to: :approved
    end

    event :not_got_answer do
      transitions from: :requested, to: :without_answer
    end

    event :return_to_requested do
      transitions from: %i[prev_approved rejected], to: :requested
    end
  end

  scope :requested, -> { where participation_state: :requested }
  scope :waiting, -> { where participation_state: :waiting }
  scope :prev_approved, -> { where participation_state: :prev_approved }
  scope :rejected, -> { where participation_state: :rejected }
  scope :approved, -> { where participation_state: :approved }
  scope :without_answer, -> { where participation_state: :without_answer }
  scope :reserved, -> { where participation_state: :reserved }

  search_by :values
end
