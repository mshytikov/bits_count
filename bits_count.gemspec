# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bits_count/version'

Gem::Specification.new do |spec|
  spec.name          = "bits_count"
  spec.version       = BitsCount::VERSION
  spec.authors       = ["Max Shytikov"]
  spec.email         = ["mshytikov@gmail.com"]
  spec.description   = "Implementation of population count in pure ruby"
  spec.summary       = "Bit counter"
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
