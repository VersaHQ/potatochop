# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'potatochop/version'

Gem::Specification.new do |gem|
  gem.name          = "potatochop"
  gem.version       = Potatochop::VERSION
  gem.authors       = ["John Mertens"]
  gem.email         = ["john@versahq.com"]
  gem.description   = %q{Potatochop - because F$%k Photoshop, that's why.}
  gem.summary       = %q{Potatochop is a simple server that compiles and serves up HAML and SASS files. The goal is to reduce friction between designers and devs in a Rails project.}
  gem.homepage      = "https://github.com/VersaHQ/potatochop"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.add_runtime_dependency 'sinatra'
  gem.add_runtime_dependency 'haml'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'simplecov'
end
