# frozen_string_literal: true

require 'font-awesome-rails'
require 'tramway/profiles'

module Tramway
  module SportSchool
    class Engine < ::Rails::Engine
      isolate_namespace Tramway::SportSchool
      ::Tramway::Profiles.records = ['::Tramway::SportSchool::Institution']
    end
  end
end
