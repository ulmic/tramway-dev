require "tramway/profiles/engine"
require 'tramway/profiles/generates/install_generator'

module Tramway
  module Profiles
    class << self
      def records=(models)
        @records = models
      end

      def records
        @records
      end
    end
  end
end
