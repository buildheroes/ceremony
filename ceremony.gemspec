# -*- encoding: utf-8 -*-
require File.expand_path('../lib/ceremony/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Andi Bade"]
  gem.email         = ["andi@galaxycats.com"]
  gem.description   = %q{ceremony is a rails engine to award achievments to whatever because of whatever}
  gem.summary       = %q{ceremony is a rails engine to award achievments to whatever because of whatever}
  gem.homepage      = "https://rubygems.org/gems/ceremony"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "ceremony"
  gem.require_paths = ["lib"]
  gem.version       = Ceremony::VERSION
end
