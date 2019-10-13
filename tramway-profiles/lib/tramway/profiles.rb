# frozen_string_literal: true

require 'tramway/profiles/engine'
require 'tramway/profiles/generates/install_generator'

module Tramway
  module Profiles
    class << self
      attr_writer :records

      attr_reader :records
    end
  end
end
