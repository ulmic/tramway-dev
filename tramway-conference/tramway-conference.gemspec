$:.push File.expand_path("../lib", __FILE__)
require "tramway/conference/version"

Gem::Specification.new do |s|
  s.name        = "tramway-conference"
  s.version     = Tramway::Conference::VERSION
  s.authors     = ["Dmitry Korotin", "Pavel Kalashnikov"]
  s.email       = ["soxat73rus@gmail.com", "kalashnikovisme@gmail.com"]
  s.homepage    = "https://github.com/ulmic/tramway-conference"
  s.summary     = "Engine for Conference web sites"
  s.description = "Engine for Conference web sites"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
end
