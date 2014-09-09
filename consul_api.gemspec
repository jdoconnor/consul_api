# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'consul_api/version'

Gem::Specification.new do |spec|
  spec.name          = "consul_api"
  spec.version       = ConsulApi::VERSION
  spec.authors       = ["Jay OConnor"]
  spec.email         = ["jay@bellycard.com"]
  spec.summary       = %q{Ruby wrapper for Consul V1 API}
  spec.description   = %q{}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'faraday'
  spec.add_dependency 'hashie'

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
