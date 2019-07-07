$:.push File.expand_path("lib", __dir__)
require "tramway/site/version"

Gem::Specification.new do |spec|
  spec.name        = "tramway-site"
  spec.version     = Tramway::Site::VERSION
  spec.authors     = ["Pavel Kalashnikov"]
  spec.email       = ["kalashnikovisme@gmail.com"]
  spec.homepage    = "https://github.com/ulmic/tramway-dev"
  spec.summary     = "Rails engine for person site"
  spec.description = "Rails engine for person site"
  spec.license     = "MIT"
end
