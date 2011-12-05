# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "encrypted-cookie-store/version"

Gem::Specification.new do |s|
  s.name        = "encrypted-cookie-store"
  s.version     = EncryptedCookieStore::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Les Fletcher"]
  s.email       = ["les.fletcher@gmail.com"]
  s.homepage    = "http://github.com/hmcfletch/encrypted-cookie-store"
  s.summary     = %q{Encrypted cookie session store for Rails 3}
  s.description = %q{Add an encrypted cookie session store for Rails 3}

  s.rubyforge_project = "encrypted-cookie-store"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency('rails', '~> 3.0')
  s.add_dependency('encrypted-cookies', '~> 1.0')
end
