# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'db_structure_writer/version'

Gem::Specification.new do |spec|
  spec.name          = "db_structure_writer"
  spec.version       = DbStructureWriter::VERSION
  spec.authors       = ["なりたけいすけ"]
  spec.email         = ["narikei1030@gmail.com"]
  spec.description   = 'this create HTML file describing the DB structure'
  spec.summary       = 'this create HTML file describing the DB structure'
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
