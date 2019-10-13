# frozen_string_literal: true

class Tramway::Event::Place < Tramway::Core::ApplicationRecord
  has_and_belongs_to_many :events
end
