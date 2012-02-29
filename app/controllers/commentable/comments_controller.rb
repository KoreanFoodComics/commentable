module Commentable
  class CommentsController < ::ApplicationController
    before_filter :find_commentable
    before_filter :require_current_user

    def create
      @comment = Comment.new(params[:comment])
      @comment.commentable = @commentable
      @comment.commenter = current_user

      respond_to do |format|
        if @comment.save
          format.html { redirect_to main_app.url_for(@commentable) }
          format.js   { render :json => { :comment => @comment, :success => true }, :content_type => 'application/json' }
        else
          message = I18n.t(:failure, :scope => [:commentable])
          format.html { redirect_to main_app.url_for(@commentable), :alert => message }
          format.js   { render :json => { :message => message, :success => false }, :content_type => 'application/json', :status => 299 }
        end
      end
    end

    private

    def find_commentable
      @commentable = params[:commentable][:type].constantize.find(params[:commentable][:id])
    end

    def require_current_user
      unless current_user
        redirect_to @commentable
      end
    end
  end
end
