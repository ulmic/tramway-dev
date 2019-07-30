$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "tramway/export/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "tramway-export"
  spec.version     = Tramway::Export::VERSION
  spec.authors     = ["Pavel Kalashnikov"]
  spec.email       = ["kalashnikovisme@gmail.com"]
  spec.homepage    = "https://github.com/ulmic/tramway-dev"
  spec.summary     = "Rails engine for exporting data"
  spec.description = "Rails engine for exporting data"
  spec.license     = "MIT"

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency 'xls_exporter'
end
