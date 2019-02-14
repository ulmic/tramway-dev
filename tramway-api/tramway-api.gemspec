$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "tramway/api/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "tramway-api"
  spec.version     = Tramway::Api::VERSION
  spec.authors     = ["Pavel Kalashnikov"]
  spec.email       = ["kalashnikovisme@gmail.com"]
  spec.homepage    = "https://github.com/kalashnikovisme/tramway-dev"
  spec.summary     = "Engine for api"
  spec.description = "Engine for api"

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency 'knock'
end
