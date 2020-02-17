# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)

# Maintain your gem's version:
require 'tramway/event/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'tramway-event'
  s.version     = Tramway::Event::VERSION
  s.authors     = ['Pavel Kalashnikov']
  s.email       = ['kalashnikovisme@gmail.com']
  s.homepage    = 'https://github.com/ulmic/tramway-event'
  s.summary     = 'Rails engine for events'
  s.description = 'Rails engine for events'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  s.add_dependency 'configus'
end
