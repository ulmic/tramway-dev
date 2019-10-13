# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)

# Maintain your gem's version:
require 'tramway/partner/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'tramway-partner'
  s.version     = Tramway::Partner::VERSION
  s.authors     = ['Pavel Kalashnikov']
  s.email       = ['kalashnikovisme@gmail.com']
  s.homepage    = 'https://github.com/ulmic/tramway-partner'
  s.summary     = 'Rails engine for partners'
  s.description = 'Rails engine for partners'
  s.license     = 'MIT'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']
end
