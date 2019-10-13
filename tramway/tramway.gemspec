# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tramway/version'

Gem::Specification.new do |spec|
  spec.name          = 'tramway'
  spec.version       = Tramway::VERSION
  spec.authors       = ['Pavel Kalashnikov']
  spec.email         = ['kalashnikovisme@gmail.com']

  spec.summary       = 'Engine for everything in your Rails app'
  spec.description   = 'Engine for everything in your Rails app'
  spec.homepage      = 'https://github.com/kalashikovisme/tramway'

  spec.require_paths = ['lib']
end
