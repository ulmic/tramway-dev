# frozen_string_literal: true

require 'tramway/conference/engine'
require 'tramway/conference/generates/install_generator'
require 'font-awesome-rails'

module Tramway
  module Conference
    class << self
      def dependencies
        %i[landing event profiles page partner]
      end

      def application
        :unity
      end
    end
  end
end
