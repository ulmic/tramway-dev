# frozen_string_literal: true

module Tramway
  module Site
    class ApplicationRecord < Tramway::Core::ApplicationRecord
      self.abstract_class = true
    end
  end
end
