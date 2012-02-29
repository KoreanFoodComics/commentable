module Commentable
  module Mixins
    module Commentable
      def self.included(commentable)
        commentable.instance_eval { has_many :comments, :class_name => 'Commentable::Comment', :as => :commentable, :dependent => :destroy }
      end
    end
  end
end
