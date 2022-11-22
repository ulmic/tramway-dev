# frozen_string_literal: true

module Tramway
  module Landing
    class ApplicationRecord < ::Tramway::ApplicationRecord
      self.abstract_class = true
    end
  end
end
