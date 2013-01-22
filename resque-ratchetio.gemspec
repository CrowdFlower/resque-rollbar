# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'resque-ratchetio/version'

Gem::Specification.new do |gem|
  gem.name          = "resque-ratchetio"
  gem.version       = Resque::Ratchetio::VERSION
  gem.authors       = ["Brian Hahn"]
  gem.email         = ["brian.hahn@crowdflower.com"]
  gem.description   = "Adds ratchetio as a resque failure backend"
  gem.summary       = "Adds ratchetio as a resque failure backend"
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.add_dependency("resque", "~> 1.23.0")
end
