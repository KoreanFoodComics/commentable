class User < ActiveRecord::Base
  include Commentable::Mixins::Commenter

  def name
    'Test User'
  end
end
