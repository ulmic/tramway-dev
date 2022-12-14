# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)

# Maintain your gem's version:
require 'tramway/mailout/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'tramway-mailout'
  s.version     = Tramway::Mailout::VERSION
  s.authors     = ['Pavel Kalashnikov']
  s.email       = ['kalashnikovisme@gmail.com']
  s.homepage    = 'https://github.com/kalashnikovisme/tramway-mailout'
  s.summary     = 'Rails Engine for your mailouts'
  s.description = 'Rails Engine for your mailouts'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  s.add_dependency 'rails', '~> 5.1.4'
  s.add_dependency 'sidekiq'
  s.add_dependency 'tramway'
end
