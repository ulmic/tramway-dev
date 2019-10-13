# frozen_string_literal: true

module Tramway
  module Event
    class ApplicationRecord < ::Tramway::Core::ApplicationRecord
      self.abstract_class = true
    end
  end
end
