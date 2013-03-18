require 'active_support'
require 'commentable/engine'
require 'commentable/version'

module Commentable
  extend ActiveSupport::Autoload

  autoload :Controllers
  autoload :Helpers
  autoload :Models
  autoload :Routes
end

ActionDispatch::Routing::Mapper.send(:include, Commentable::Routes)
