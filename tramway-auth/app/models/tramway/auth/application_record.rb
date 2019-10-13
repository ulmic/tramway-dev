# frozen_string_literal: true

module Tramway
  module Auth
    class ApplicationRecord < ActiveRecord::Base
      self.abstract_class = true
    end
  end
end
