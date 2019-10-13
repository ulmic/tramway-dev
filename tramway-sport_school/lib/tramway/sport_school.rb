# frozen_string_literal: true

require 'tramway/sport_school/engine'
require 'tramway/sport_school/generates/install_generator'
require 'font-awesome-rails'

module Tramway
  module SportSchool
    class << self
      def dependencies
        %i[landing profiles news user]
      end

      def application
        :institution
      end
    end
  end
end
