# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'curler/version'

Gem::Specification.new do |spec|
  spec.name          = "curler"
  spec.version       = Curler::VERSION
  spec.authors       = ["Darryl Pogue"]
  spec.email         = ["darryl@dpogue.ca"]
  spec.summary       = %q{Log outgoing network requests as cURL commands.}
  spec.homepage      = "https://github.com/dpogue/curler"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", ">= 2.1.0"
  spec.add_development_dependency "rake", ">= 12.3.3"
end
