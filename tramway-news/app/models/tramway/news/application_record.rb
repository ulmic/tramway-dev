module Tramway
  module News
    class ApplicationRecord < ActiveRecord::Base
      self.abstract_class = true
    end
  end
end
