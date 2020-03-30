# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)

# Maintain your gem's version:
require 'tramway/landing/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'tramway-landing'
  s.version     = Tramway::Landing::VERSION
  s.authors     = ['Pavel Kalashnikov']
  s.email       = ['kalashnikovisme@gmail.com']
  s.authors     = ['moshinaan']
  s.email       = ['moshinaan@gmail.com']
  s.homepage    = 'https://github.com/kalashnikovisme/tramway-landing'
  s.summary     = 'Landing Engine for your Rails projects'
  s.description = 'Landing Engine for your Rails projects'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']
end
