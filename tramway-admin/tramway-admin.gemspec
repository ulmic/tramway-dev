$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "tramway/admin/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "tramway-admin"
  s.version     = Tramway::Admin::VERSION
  s.authors     = ["Pavel Kalashnikov"]
  s.email       = ["kalashnikovisme@gmail.com"]
  s.homepage    = "https://github.com/kalashnikovisme/tramway-admin"
  s.summary     = "Engine for admin"
  s.description = "Engine for admin"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency 'tramway-user'
end
