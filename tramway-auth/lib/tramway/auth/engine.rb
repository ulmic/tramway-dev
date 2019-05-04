module Tramway
  module Auth
    class Engine < ::Rails::Engine
      isolate_namespace Tramway::Auth
    end
  end
end
