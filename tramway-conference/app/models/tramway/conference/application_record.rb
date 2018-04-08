module Tramway
  module Conference
    class ApplicationRecord < ActiveRecord::Base
      self.abstract_class = true
    end
  end
end
