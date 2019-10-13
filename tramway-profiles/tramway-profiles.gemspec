# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)

require 'tramway/profiles/version'

Gem::Specification.new do |s|
  s.name        = 'tramway-profiles'
  s.version     = Tramway::Profiles::VERSION
  s.authors     = ['Pavel Kalashnikov']
  s.email       = ['kalashnikovisme@gmail.com']
  s.homepage    = 'https://github.com/ulmic/tramway-profiles'
  s.summary     = 'Rails engine for social networks profiles'
  s.description = 'Rails engine for social networks profiles'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']
end
