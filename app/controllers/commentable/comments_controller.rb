module Commentable
  class CommentsController < ApplicationController
    before_filter :find_commentable
    before_filter :require_current_user

    def create
      @comment = Comment.new(params[:comment])
      @comment.commentable = @commentable
      @comment.commenter = current_user

      respond_to do |format|
        if @comment.save
          format.html { redirect_to main_app.url_for(@commentable) }
          # format.js   { :json => { :commentable => @comment, :success => true }, :content_type => 'application/json' }
        else
          format.html { redirect_to main_app.url_for(@commentable), :alert => I18n.t(:failure, :scope => [:commentable]) }
          # format.js   { :json => { :commentable => @comment, :success => false }, :content_type => 'application/json' }
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
