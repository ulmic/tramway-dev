# frozen_string_literal: true

require 'font-awesome-rails'
require 'tramway/profiles'

module Tramway
  module Conference
    class Engine < ::Rails::Engine
      isolate_namespace Tramway::Conference
      ::Tramway::Profiles.records = ['::Tramway::Conference::Unity', '::Tramway::User']
    end
  end
end
