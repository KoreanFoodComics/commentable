class ApplicationController < ActionController::Base
  protect_from_forgery

  helper Commentable::Engine.helpers
  helper_method :current_user

  def current_user
    User.first
  end
end
