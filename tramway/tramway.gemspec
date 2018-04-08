# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "tramway/version"

Gem::Specification.new do |spec|
  spec.name          = "tramway"
  spec.version       = Tramway::VERSION
  spec.authors       = ["Pavel Kalashnikov"]
  spec.email         = ["kalashnikovisme@gmail.com"]

  spec.summary       = %q{Engine for everything in your Rails app}
  spec.description   = %q{Engine for everything in your Rails app}
  spec.homepage      = "https://github.com/kalashikovisme/tramway"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
