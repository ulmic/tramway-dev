module Tramway
  module Admin
    class Engine < ::Rails::Engine
      isolate_namespace Tramway::Admin
    end
  end
end
