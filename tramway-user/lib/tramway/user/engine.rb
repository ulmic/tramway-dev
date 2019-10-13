# frozen_string_literal: true

module Tramway
  module User
    class Engine < ::Rails::Engine
      isolate_namespace Tramway::User
    end
  end
end
