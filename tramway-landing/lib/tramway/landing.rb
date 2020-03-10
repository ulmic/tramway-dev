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
    end
  end
end
