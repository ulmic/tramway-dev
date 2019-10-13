# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)

# Maintain your gem's version:
require 'tramway/auth/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = 'tramway-auth'
  spec.version     = Tramway::Auth::VERSION
  spec.authors     = ['Pavel Kalashnikov']
  spec.email       = ['kalashnikovisme@gmail.com']
  spec.homepage    = 'https://github.com/ulmic/tramway-dev'
  spec.summary     = 'Rails engine for auth'
  spec.description = 'Rails engine for auth'
  spec.license     = 'MIT'

  spec.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']
end
