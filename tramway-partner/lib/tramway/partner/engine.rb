# frozen_string_literal: true

module Tramway
  module Partner
    class Engine < ::Rails::Engine
      isolate_namespace Tramway::Partner
    end
  end
end
