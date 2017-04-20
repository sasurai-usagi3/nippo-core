$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "nippo_core/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "nippo_core"
  s.version     = NippoCore::VERSION
  s.authors     = ["Takumu Uyama"]
  s.email       = ["sasurai.usagi3@gmail.com"]
  s.homepage    = "https://github.com/sasurai-usagi3/nippo-core"
  s.summary     = "This is a daily report system"
  s.description = "daily report!"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.0.2"

  s.add_dependency "mysql2"
  s.add_dependency "slim-rails"
  s.add_dependency "devise"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "shoulda-matchers"
  s.add_development_dependency "factory_girl_rails"
end
