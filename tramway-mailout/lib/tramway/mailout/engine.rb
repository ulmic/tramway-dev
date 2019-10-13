# frozen_string_literal: true

require 'sidekiq'

module Tramway
  module Mailout
    class Engine < ::Rails::Engine
      isolate_namespace Tramway::Mailout
      ::Sidekiq::Extensions.enable_delay!
    end
  end
end
