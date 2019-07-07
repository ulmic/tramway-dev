module Tramway
  module Site
    class Engine < ::Rails::Engine
      isolate_namespace Tramway::Site
    end
  end
end
