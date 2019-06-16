class Tramway::Event::Participant < ::Tramway::Event::ApplicationRecord
  belongs_to :event, class_name: 'Tramway::Event::Event'
  
  state_machine :participation_state, initial: :requested do
    state :requested
    state :prev_approved
    state :waiting
    state :rejected
    state :approved
    state :without_answer
    state :reserved

    event :previous_approve do
      transition [ :requested, :without_answer, :waiting ] => :prev_approved
    end

    event :wait_for_decision do
      transition [ :requested, :without_answer ] => :waiting
    end

    event :reject do
      transition [ :requested, :without_answer, :waiting, :prev_approved ] => :rejected
    end

    event :approve do
      transition [ :prev_approved, :reserved, :requested ] => :approved
    end

    event :not_got_answer do
      transition requested: :without_answer
    end

    event :reserve do
      transition [ :requested, :without_answer, :waiting ] => :reserved
    end

    event :return_to_requested do
      transition rejected: :requested
    end
  end

  scope :requested, -> { where participation_state: :requested }
  scope :waiting, -> { where participation_state: :waiting }
  scope :prev_approved, -> { where participation_state: :prev_approved }
  scope :rejected, -> { where participation_state: :rejected }
  scope :approved, -> { where participation_state: :approved }
  scope :without_answer, -> { where participation_state: :without_answer }
  scope :reserved, -> { where participation_state: :reserved }

  pg_search_scope :search, against: [:values]
end
