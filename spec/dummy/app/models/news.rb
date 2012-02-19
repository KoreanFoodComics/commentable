class News < ActiveRecord::Base
  include Commentable::Mixins::Commentable
end
