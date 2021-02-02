# frozen_string_literal: true

class Tramway::Event::Action < Tramway::Core::ApplicationRecord
  belongs_to :event, class_name: 'Tramway::Event::Event'

  aasm :action_state, column: :action_state do
    state :must_be_done, initial: true
    state :done
    state :declined

    event :do do
      transitions from: :must_be_done, to: :done
    end

    event :decline do
      transitions from: :must_be_done, to: :declined
    end

    event :return do
      transitions from: %i[declined done], to: :must_be_done
    end
  end
end
