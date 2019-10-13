# frozen_string_literal: true

module Tramway
  module Page
    class Engine < ::Rails::Engine
      isolate_namespace Tramway::Page
    end
  end
end
