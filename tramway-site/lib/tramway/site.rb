# frozen_string_literal: true

require 'tramway/site/engine'
require 'tramway/site/generates/install_generator'

module Tramway
  module Site
    class << self
      def dependencies
        %i[landing profiles]
      end

      def application
        :person
      end
    end
  end
end
