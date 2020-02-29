class Tramway::Event::Action < Tramway::Core::ApplicationRecord
  belongs_to :event, class_name: 'Tramway::Event::Event'

  state_machine :action_state, initial: :must_be_done do
    state :must_be_done
    state :done
    state :declined

    event :do do
      transition must_be_done: :done
    end

    event :decline do
      transition must_be_done: :declined
    end

    event :return do
      transition [ :declined, :done ] => :must_be_done
    end
  end
end
