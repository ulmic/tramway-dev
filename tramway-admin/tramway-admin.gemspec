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

  s.add_dependency 'tramway-user', '~> 1.0.2', '>= 1.0.2'
  s.add_dependency 'bootstrap-kaminari-views-reload', '0.0.5'
  s.add_dependency 'ckeditor', '4.2.4'
  s.add_dependency 'font-awesome-rails', '~> 4.7', '>= 4.7.0.1'
  s.add_dependency 'copyright_mafa', '~> 0.1.2', '>= 0.1.2'
  s.add_dependency 'kaminari', '~> 1.1.1', '>= 1.1.1'
  s.add_dependency 'state_machine_buttons', '~> 0.4.1', '>= 0.4.1'
end
