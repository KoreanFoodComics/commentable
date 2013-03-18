class News < ActiveRecord::Base
  include Commentable::Models::Commentable
end
