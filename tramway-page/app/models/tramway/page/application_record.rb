module Tramway
  module Page
    class ApplicationRecord < ActiveRecord::Base
      self.abstract_class = true
    end
  end
end
