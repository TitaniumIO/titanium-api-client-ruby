# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'titanium_api_client/version'

Gem::Specification.new do |spec|
  spec.name          = "titanium_api_client"
  spec.version       = TitaniumApiClient::VERSION
  spec.authors       = ["Titanium"]
  spec.email         = ["support@titanium.io"]
  spec.summary       = %q{Titanium ruby client}
  spec.description   = %q{Official ruby client for interacting with Titanium's JSON API}
  spec.homepage      = "https://www.titanium.io"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_runtime_dependency('rest-client', '~> 1.8.0')
  spec.add_runtime_dependency('virtus', '~> 1.0.1')

  spec.required_ruby_version = '>= 1.9.3'
end
