$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "tramway/notify/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "tramway-notify"
  spec.version     = Tramway::Notify::VERSION
  spec.authors     = ["Pavel Kalashnikov"]
  spec.email       = ["kalashnikovisme@gmail.com"]
  spec.summary     = "Rails engine for notifications"
  spec.description = "Rails engine for notifications"
  spec.homepage    = "https://github.com/ulmic/tramway-dev"
  spec.license     = "MIT"

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
end
