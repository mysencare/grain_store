# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'grain_store/version'

Gem::Specification.new do |spec|
  spec.name          = "grain_store"
  spec.version       = GrainStore::VERSION
  spec.authors       = ["Thomas Riboulet"]
  spec.email         = ["riboulet@gmail.com"]

  spec.summary       = %q{A small library to handle access to key value stores with a common API}
  spec.description   = %q{A small library to handle access to key value stores with a common API}
  spec.homepage      = "https://github.com/mysencare/"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com' to prevent pushes to rubygems.org, or delete to allow pushes to any server."
  end

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rspec-its"

  spec.add_dependency "redis"
end
