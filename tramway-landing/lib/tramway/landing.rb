# frozen_string_literal: true

require 'tramway/landing/engine'
require 'tramway/landing/generates/install_generator'

module Tramway
  module Landing
    class << self
      attr_accessor :head_content
    end
  end
end
