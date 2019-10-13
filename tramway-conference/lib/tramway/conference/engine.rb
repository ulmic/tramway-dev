# frozen_string_literal: true

require 'font-awesome-rails'

module Tramway
  module Conference
    class Engine < ::Rails::Engine
      isolate_namespace Tramway::Conference
    end
  end
end
