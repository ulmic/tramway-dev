$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "tramway/page/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "tramway-page"
  s.version     = Tramway::Page::VERSION
  s.authors     = ["Pavel Kalashnikov"]
  s.email       = ["kalashnikovisme@gmail.com"]
  s.homepage    = "https://github.com/ulmic/tramway-dev"
  s.summary     = "Summary of Tramway::Page."
  s.description = "Description of Tramway::Page."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
end
