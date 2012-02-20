class User < ActiveRecord::Base
  include Commentable::Mixins::Commenter
end
