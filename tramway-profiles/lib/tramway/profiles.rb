# frozen_string_literal: true

require 'tramway/profiles/engine'
require 'tramway/profiles/generates/install_generator'

module Tramway
  module Profiles
    class << self
      def records=(*models)
        @@records ||= []
        @@records += (models.map do |model|
          model.to_s.sub(/^\:\:/, '')
        end)
      end

      def records
        defined?(@@records) ? @@records.uniq : []
      end
    end
  end
end
