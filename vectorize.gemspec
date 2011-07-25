# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "vectorize/version"

Gem::Specification.new do |s|
  s.name        = "vectorize"
  s.version     = Vectorize::VERSION
  s.authors     = ["Mike Bethany", "Andy Lindeman"]
  s.email       = ["mikbe.tk@gmail.com", "alindeman@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{A simple wrapper and API for the Cairo Graphics library.}
  s.description = %q{Provides a one-to-one FFI wrapper for the Cairo Graphics library in addition to an API for Cairo that greatly simplifies its usage.}

  s.rubyforge_project = "vectorize"

  s.add_development_dependency("rspec", "~>2.6")

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "ffi", "~>1.0.9"
end
