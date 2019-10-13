# frozen_string_literal: true

module Tramway
  module Export
    class Engine < ::Rails::Engine
      isolate_namespace Tramway::Export
    end
  end
end
