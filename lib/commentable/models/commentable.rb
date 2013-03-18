module Commentable::Models::Commentable
  def self.included(commentable)
    commentable.instance_eval { has_many :comments, :class_name => 'Comment', :as => :commentable, :dependent => :destroy }
  end
end
