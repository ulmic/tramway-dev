$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "tramway/news/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "tramway-news"
  s.version     = Tramway::News::VERSION
  s.authors     = ["Pavel Kalashnikov"]
  s.email       = ["kalashnikovisme@gmail.com"]
  s.homepage    = "https://github.com/ulmic/tramway-dev"
  s.summary     = "Rails engine for news"
  s.description = "Rails engine for news"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
end
