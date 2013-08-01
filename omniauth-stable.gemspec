# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth/stable/version'

Gem::Specification.new do |spec|
  spec.name          = "omniauth-stable"
  spec.version       = Omniauth::Stable::VERSION
  spec.authors       = ["Stafford Brooke"]
  spec.email         = ["stafford@bignerdranch.com"]
  spec.description   = %q{Omniauth Strategy for BNR's Stable}
  spec.summary       = %q{Use this gem to implement an Omniauth client for Stable.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_dependency 'omniauth-oauth2'
  spec.add_development_dependency 'rspec', ">= 2.8.0"
  spec.add_development_dependency 'rdoc', ">= 3.12"
  spec.add_development_dependency 'bundler', ">= 1.0.0"
  spec.add_development_dependency 'dotenv'
  spec.add_development_dependency 'coveralls'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'vcr'
  spec.add_development_dependency 'webmock'
end
