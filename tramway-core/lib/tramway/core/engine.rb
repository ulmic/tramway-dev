require 'tramway/core/generators/install_generator'
require 'tramway/core/application'
require 'simple_form'

module Tramway
  module Core
    class Engine < ::Rails::Engine
      isolate_namespace Tramway::Core

      config.before_initialize do
        config.i18n.available_locales = [:ru]
        config.i18n.default_locale = :ru
        config.i18n.load_path += Dir["#{config.root}/config/locales/**/*.yml"]
      end
    end
  end
end
