module Tramway
  module User
    class ApplicationRecord < ::Tramway::Core::ApplicationRecord
      self.abstract_class = true
    end
  end
end
