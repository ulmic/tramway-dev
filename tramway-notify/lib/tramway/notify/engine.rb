# frozen_string_literal: true

module Tramway
  module Notify
    class Engine < ::Rails::Engine
      isolate_namespace Tramway::Notify
    end
  end
end
