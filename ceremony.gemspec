$:.push File.expand_path("../lib", __FILE__)

require "ceremony/version"

Gem::Specification.new do |s|
  s.name        = "ceremony"
  s.version     = Ceremony::VERSION
  s.authors     = ["Andi Bade"]
  s.email       = ["andi@buildheroes.com"]
  s.homepage    = "https://rubygems.org/gems/ceremony"
  s.summary     = "ceremony is a rails engine to award achievments to whatever because of whatever"
  s.description = "ceremony is a rails engine to award achievments to whatever because of whatever"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.11"

  # s.add_development_dependency "sqlite3"
end
