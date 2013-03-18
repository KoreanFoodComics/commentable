module Commentable::Helpers::Comments
  def comments_for(commentable)
    render :partial => 'comments/comments', :locals => { :commentable => commentable }
  end

  def new_comment_form_for(commentable)
    if current_user
      render :partial => 'comments/new', :locals => { :commentable => commentable }
    end
  end
end
