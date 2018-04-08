# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "tramway/version"

Gem::Specification.new do |spec|
  spec.name          = "tramway"
  spec.version       = Tramway::VERSION
  spec.authors       = ["Pavel Kalashnikov"]
  spec.email         = ["kalashnikovisme@gmail.com"]

  spec.summary       = %q{Engine for everything in your Rails app}
  spec.description   = %q{Engine for everything in your Rails app}
  spec.homepage      = "https://github.com/kalashikovisme/tramway"

  spec.require_paths = ["lib"]
end
