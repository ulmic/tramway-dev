# frozen_string_literal: true

module Tramway
  module Partner
    class ApplicationRecord < ::Tramway::ApplicationRecord
      self.abstract_class = true
    end
  end
end
