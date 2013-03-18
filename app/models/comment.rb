class Comment < ActiveRecord::Base
  include Commentable::Models::Comment
end
