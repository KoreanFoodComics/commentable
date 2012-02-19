module Commentable
  module Mixins
    module Commenter
      def self.included(commenter)
        commenter.instance_eval { has_many :comments, :class_name => 'Commentable::Comment', :as => :commenter, :dependent => :destroy }
      end

      def commenter_name
        name
      end
    end
  end
end
