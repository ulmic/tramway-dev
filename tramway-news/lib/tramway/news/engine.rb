module Tramway
  module News
    class Engine < ::Rails::Engine
      isolate_namespace Tramway::News
    end
  end
end
