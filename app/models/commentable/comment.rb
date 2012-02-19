module Commentable
  class Comment < ActiveRecord::Base
    belongs_to :commentable, :polymorphic => true, :counter_cache => true
    belongs_to :commenter,   :polymorphic => true, :counter_cache => true

    validates :body, :presence => true

    delegate :commenter_name, :to => :commenter
  end
end
