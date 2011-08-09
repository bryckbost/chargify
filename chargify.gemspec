# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "chargify/version"

Gem::Specification.new do |s|
  s.name        = "chargify"
  s.version     = Chargify::VERSION
  s.authors     = ["Steve Richert"]
  s.email       = ["steve.richert@gmail.com"]
  s.homepage    = "https://github.com/laserlemon/chargify"
  s.summary     = "A Ruby wrapper for the Chargify API"
  s.description = "A Ruby wrapper for the Chargify API"

  s.rubyforge_project = "chargify"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{|f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency "faraday_middleware", "~> 0.7.0"
  s.add_runtime_dependency "hashie", "~> 1.1.0"
  s.add_runtime_dependency "multi_json", "~> 1.0.3"
end
