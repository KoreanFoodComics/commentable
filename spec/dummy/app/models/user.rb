class User < ActiveRecord::Base
  include Commentable::Models::Commenter
end
