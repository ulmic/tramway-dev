# frozen_string_literal: true

module Tramway
  module Event
    class Engine < ::Rails::Engine
      isolate_namespace Tramway::Event
    end
  end
end
