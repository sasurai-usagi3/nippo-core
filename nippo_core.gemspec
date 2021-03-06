$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'nippo_core/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'nippo_core'
  s.version     = NippoCore::VERSION
  s.authors     = ['Takumu Uyama']
  s.email       = ['sasurai.usagi3@gmail.com']
  s.homepage    = 'https://github.com/sasurai-usagi3/nippo-core'
  s.summary     = 'This is a daily report system for Rails application.'
  s.description = 'This is a web application you can share and stock a daily report. You can report and share a daily report among your company group, club, teammate etc.'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  s.add_dependency 'rails', '~> 5.0.2'

  s.add_dependency 'slim-rails'
  s.add_dependency 'devise'
  s.add_dependency 'active_decorator'
  s.add_dependency 'redcarpet'
  s.add_dependency 'pundit'
  s.add_dependency 'kaminari'
  s.add_dependency 'gretel'
  s.add_dependency 'meta-tags'
  s.add_development_dependency 'mysql2'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'shoulda-matchers'
  s.add_development_dependency 'factory_girl_rails'
end
