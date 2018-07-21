require "tramway/sport_school/engine"
require 'tramway/sport_school/generates/install_generator'
require 'font-awesome-rails'

module Tramway
  module SportSchool
    class << self
      def dependencies
        [ :landing, :profiles, :news, :user ]
      end
    end
  end
end
