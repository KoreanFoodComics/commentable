# Configure Rails Envinronment
ENV['RAILS_ENV'] = 'test'
require File.expand_path('../dummy/config/environment.rb',  __FILE__)

require 'rspec/rails'
require 'capybara/rspec'
require 'capybara/poltergeist'
require 'valid_attribute'
require 'factory_girl_rails'
require 'launchy'
require 'bourne'
require 'debugger'

ENGINE_RAILS_ROOT=File.join(File.dirname(__FILE__), '../')

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[File.join(ENGINE_RAILS_ROOT, 'spec/support/**/*.rb')].each { |f| require f }

Capybara.javascript_driver = :poltergeist

RSpec.configure do |config|
  config.mock_with :mocha
  config.use_transactional_fixtures = false
  config.include FactoryGirl::Syntax::Methods
end
