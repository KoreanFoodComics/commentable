module Commentable
  module CommentsHelper
    def comments_for(commentable)
      render :partial => 'commentable/comments/comments', :locals => { :commentable => commentable }
    end

    def new_comment_form_for(commentable)
      if current_user
        render :partial => 'commentable/comments/new', :locals => { :commentable => commentable }
      end
    end
  end
end
