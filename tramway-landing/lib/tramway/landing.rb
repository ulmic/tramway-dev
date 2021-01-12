# frozen_string_literal: true

require 'tramway/landing/engine'
require 'tramway/landing/generates/install_generator'

module Tramway
  module Landing
    class << self
      def head_content=(content)
        @@head_content ||= []
        @@head_content += [content]
      end

      def head_content
        (defined?(@@head_content) && @@head_content) || []
      end

      def set_navbar(bool, project:)
        @@navbars ||= {}
        @@navbars.merge! project => bool
      end

      def navbar_for(project)
        @@navbars.with_indifferent_access[project]
      end
    end
  end
end
