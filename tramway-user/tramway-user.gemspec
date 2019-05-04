$:.push File.expand_path("../lib", __FILE__)

require "tramway/user/version"

Gem::Specification.new do |s|
  s.name        = "tramway-user"
  s.version     = Tramway::User::VERSION
  s.authors     = ["Pavel Kalashnikov"]
  s.email       = ["kalashnikovisme@gmail.com"]
  s.homepage    = 'https://github.com/ulmic/tramway-dev'
  s.summary     = 'Engine for users in your Rails app'
  s.description = 'Engine for users in your Rails app'
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency 'bcrypt', '~> 3.1.11', '>= 3.1.11'
  s.add_dependency 'enumerize', '~> 2.1', '>= 2.1.2'
end
