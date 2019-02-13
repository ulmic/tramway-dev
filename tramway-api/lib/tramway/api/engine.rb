module Tramway
  module Api
    class Engine < ::Rails::Engine
      isolate_namespace Tramway::Api
    end
  end
end
