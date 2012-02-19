$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'commentable/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'commentable'
  s.version     = Commentable::VERSION
  s.authors     = ['Brian Cardarella']
  s.email       = ['brian@dockyard.com', 'bcardarella@gmail.com']
  s.homepage    = 'https://github.com/dockyard/commentable'
  s.summary     = 'Add comments to any model in a Rails app'
  s.description = 'Add comments to any model in a Rails app'

  s.files = Dir['{app,config,db,lib}/**/*'] + ['MIT-LICENSE', 'Rakefile', 'README.rdoc']

  s.add_dependency 'rails', '~> 3.2.1'

  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'capybara-webkit'
  s.add_development_dependency 'factory_girl_rails'
  s.add_development_dependency 'pry'
end
