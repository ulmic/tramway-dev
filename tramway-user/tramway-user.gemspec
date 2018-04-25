$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "tramway/user/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "tramway-user"
  s.version     = Tramway::User::VERSION
  s.authors     = ["Pavel Kalashnikov"]
  s.email       = ["kalashnikovisme@gmail.com"]
  s.homepage    = 'https://github.com/kalashnikovisme/tramway-user'
  s.summary     = 'Engine for users in your Rails app'
  s.description = 'Engine for users in your Rails app'
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency 'bcrypt', '~> 3.1.11', '>= 3.1.11'
  s.add_dependency 'tramway-core', '~> 1.1.0.1', '>= 1.1.0.1'
end
