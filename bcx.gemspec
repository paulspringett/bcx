# -*- encoding: utf-8 -*-
require File.expand_path('../lib/bcx/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Paul Springett"]
  gem.email         = ["paul@springett.me"]
  gem.description   = %q{Fully-fledged Ruby API wrapper for Basecamp Next}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "bcx"
  gem.require_paths = ["lib"]
  gem.version       = Bcx::VERSION

  gem.add_runtime_dependency 'rapidash', '~> 0.2.0'
end
