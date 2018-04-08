$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "tramway/sport_school/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "tramway-sport_school"
  s.version     = Tramway::SportSchool::VERSION
  s.authors     = ["Pavel Kalashnikov"]
  s.email       = ["kalashnikovisme@gmail.com"]
  s.homepage    = "https://github.com/kalashnikovisme/tramway-sport_school"
  s.summary     = "Engine for Sport School web sites"
  s.description = "Engine for Sport School web sites"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_development_dependency "pg"
end
