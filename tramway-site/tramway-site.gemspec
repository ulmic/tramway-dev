# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)
require 'tramway/site/version'

Gem::Specification.new do |s|
  s.name        = 'tramway-site'
  s.version     = Tramway::Site::VERSION
  s.authors     = ['Pavel Kalashnikov']
  s.email       = ['kalashnikovisme@gmail.com']
  s.homepage    = 'https://github.com/ulmic/tramway-dev'
  s.summary     = 'Rails engine for person site'
  s.description = 'Rails engine for person site'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']
end
